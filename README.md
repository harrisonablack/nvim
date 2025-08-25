![](https://skillicons.dev/icons?i=apple,neovim,lua,github)

# Neovim
This is my own personal Neovim config i use.

The config is split into 4 files, the root `init.lua` which calls `lua/nvim/plugins.lua`, `lua/nvim/settings.lua` and `lua/nvim/keymaps.lua`

## Installation and setup
> [!IMPORTANT]
> nvim <=v0.12 is required as this config uses the newly introduced vim.pack

To install the config, clone the repo to your config folder, typically `~/.config/nvim`. Nvim will then prompt to install all plugins
```
git clone https://github.com/harrisonablack/nvim.git ~/.config/nvim && nvim
```
### Linters, LSP's, DSP's and formatters
[mason.nvim](https://github.com/williamboman/mason.nvim) is used to manage LSPs, linters etc and as such can be installed using `:Mason` 
