-- Layout:
--   <mode glyph> <filename> <git branch>   %=   <info> <warn> <error> <line:col>
--
-- Every element is a plain string segment; each colored segment sets its own
-- highlight with `%#Group#`, and `#StatusLine#` resets back to the bar's
-- default look.

local M = {}

-- Accent palette for the mode glyph. Foreground only — the segment background
-- is left transparent so it sits on the bar's own background.
local palette = {
  normal = "#78A9FF", -- blue
  insert = "#25be6a", -- green
  visual = "#3DDBD9", -- teal
  replace = "#EE5396", -- red
  command = "#33B1FF", -- cyan
  terminal = "#BE95FF", -- magenta
}

-- Diagnostic rows: the bare count is coloured, so the colour of the token is
-- the cue — blue info, amber warn, red error (like nyoom's modeline). These
-- are deliberate conventional colours rather than carbonfox's remapped ones.
local diag = {
  { hl = "StatusLineDiagInfo", fg = "#78A9FF", severity = vim.diagnostic.severity.INFO },
  { hl = "StatusLineDiagWarn", fg = "#E5C07B", severity = vim.diagnostic.severity.WARN },
  { hl = "StatusLineDiagError", fg = "#F26D6D", severity = vim.diagnostic.severity.ERROR },
}

-- Mode category -> highlight group name.
local mode_hl = {
  normal = "StatusModeNormal",
  insert = "StatusModeInsert",
  visual = "StatusModeVisual",
  replace = "StatusModeReplace",
  command = "StatusModeCommand",
  terminal = "StatusModeTerminal",
}

local function define_highlights()
  for kind, group in pairs(mode_hl) do
    vim.api.nvim_set_hl(0, group, { fg = palette[kind] })
  end

  for _, d in ipairs(diag) do
    vim.api.nvim_set_hl(0, d.hl, { fg = d.fg })
  end
end

local function setup()
  vim.api.nvim_create_augroup("HarrisonStatusline", { clear = true })
  vim.api.nvim_create_autocmd("ColorScheme", {
    group = "HarrisonStatusline",
    callback = define_highlights,
  })
  define_highlights()
end

-- Map the current mode to a single-glyph label and a highlight category.
local function resolve(mode)
  local initial = mode:sub(1, 1)

  if initial == "i" then
    return "I", "insert"
  end
  if initial == "R" then
    return "R", "replace"
  end
  if initial == "c" then
    return "C", "command"
  end
  if mode == "t" then
    return "T", "terminal"
  end
  if mode == "v" or mode == "V" or mode == "\22" then
    return "V", "visual"
  end
  if mode == "s" or mode == "S" or mode == "\19" then
    return "S", "visual"
  end
  if mode == "!" then
    return "!", "command"
  end

  return "N", "normal"
end

local function filename()
  local name = vim.fn.expand "%:t"
  if name == "" then
    name = "[No Name]"
  end
  return name
end

-- Active git branch via gitsigns, nil when absent.
local function git()
  local dict = vim.b.gitsigns_status_dict
  if type(dict) == "table" and type(dict.head) == "string" and dict.head ~= "" then
    return dict.head
  end
end

-- Info/warn/error counts rendered as bare numbers; colour is the cue.
local function diagnostics()
  local parts = {}
  for _, d in ipairs(diag) do
    local n = 0
    pcall(function()
      n = #vim.diagnostic.get(0, { severity = d.severity })
    end)
    parts[#parts + 1] = string.format("%%#%s#%d", d.hl, n)
  end
  return table.concat(parts, " ")
end

function M.build()
  local mode = vim.api.nvim_get_mode().mode
  local glyph, kind = resolve(mode)

  local name = filename()
  local branch = git()
  local diags = diagnostics()

  local parts = {
    "%#" .. mode_hl[kind] .. "# " .. glyph .. " ",
    "%#StatusLine#" .. name .. " ",
  }
  if branch then
    parts[#parts + 1] = "%#Comment#" .. branch .. "%#StatusLine#"
  end

  parts[#parts + 1] = "%="
  parts[#parts + 1] = "%#StatusLine# " .. diags
  parts[#parts + 1] = "%#StatusLine# %l:%c "

  return table.concat(parts)
end

setup()

return M
