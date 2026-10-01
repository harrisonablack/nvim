require("oil").setup()
require("oil-git").setup()

require("telescope").setup {
  defaults = {
    prompt_title = false,
    results_title = false,
    preview_title = false,
    sorting_strategy = "ascending",
    selection_caret = "",
    entry_prefix = "",
    preview = { treesitter = true },
    layout_strategy = "horizontal",

    borderchars = {
      "", -- top
      "", -- right
      "", -- bottom
      "", -- left
      "", -- top-left
      "", -- top-right
      "", -- bottom-right
      "", -- bottom-left
    },
    path_displays = { "smart" },
    layout_config = {
      height = 100,
      width = 400,
      prompt_position = "top",
      preview_cutoff = 40,
    },
  },
  pickers = {
    find_files = {
      prompt_title = "",
      preview_title = "",
    },
    live_grep = {
      prompt_title = "",
      preview_title = "",
    },
    grep_string = {
      prompt_title = "",
      preview_title = "",
    },
    buffers = {
      prompt_title = "",
      preview_title = "",
    },
    prompt_prefix = "",
    selection_caret = "",
    entry_prefix = "",
  },
}

require("telescope").load_extension "ui-select"

require("nvim-treesitter").setup()
require("nvim-ts-autotag").setup()
require("mini.pairs").setup()
require("ibl").setup()
require("gitsigns").setup {
  on_attach = function(bufnr)
    local gs = require "gitsigns"
    local function map(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
    end
    map("<leader>hj", function()
      gs.nav_hunk "next"
    end, "Git: Next hunk")
    map("<leader>hk", function()
      gs.nav_hunk "prev"
    end, "Git: Previous hunk")
    map("<leader>hp", gs.preview_hunk, "Git: Preview hunk")
    map("<leader>hs", gs.stage_hunk, "Git: Stage hunk")
    map("<leader>hr", gs.reset_hunk, "Git: Reset hunk")
  end,
}
