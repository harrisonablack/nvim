local cmp = require "blink.cmp"
cmp.build():pwait()
cmp.setup {
  fuzzy = { implementation = "lua" },
  keymap = {
    preset = "default",
    ["<Tab>"] = { "select_and_accept", "fallback" },
  },
  completion = {
    menu = {
      border = "none",
      draw = {
        padding = 0,
        columns = {
          { "kind_icon" },
          { "label" },
          { "label_description" },
        },
      },
    },
  },
  signature = { enabled = true },
}

-- Set completion capabilities before Mason or Java enables any server.
vim.lsp.config("*", { capabilities = cmp.get_lsp_capabilities() })
require("mason").setup()
require("mason-lspconfig").setup {
  automatic_enable = { exclude = { "jdtls" } },
}

-- Java owns JDTLS configuration, test support, and nvim-dap integration.
require("java").setup {
  jdk = { auto_install = false },
  spring_boot_tools = { enable = false },
}
vim.lsp.enable "jdtls"

require("fidget").setup()
require("trouble").setup()
