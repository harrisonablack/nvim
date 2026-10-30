![](https://skillicons.dev/icons?i=neovim,linux,apple,lua,github)

# Neovim



> *"This morning I realised in horror that I was actually working on a project instead of messing with my neovim configuration"* - Sylvan "Vimothee" Franklin

![](/img/nvim.png)

This is my own personal Neovim config i use. Currently i used neovim inside Superlogicals [Rex](https://www.superlogical.com/) multiplexer, currently in open beta.

The config is split into 6 main files, the root `init,lua` which calls `lua/harrisonablack/init.lua`, this then loads `lua/harrisonablack/options` `lua/harrisonablack/keymaps` and `lua/harrisonablack/plugins` the config is prioritised to be simple and readble

## Installation and setup
> [!IMPORTANT]
> Neovim <=v0.12 is required to use the builtin `vim.pack`

To install the config, clone the repo to your config folder, typically `~/.config/nvim`. Nvim will then prompt to install all plugins
```
git clone https://github.com/harrisonablack/nvim.git ~/.config/nvim && nvim
```

## Linters, LSP's, DSP's and formatters
[mason.nvim](https://github.com/mason-org/mason.nvim) is used to install LSPs, linters etc and as such can be installed using `:Mason`, or to get help `:help mason`
