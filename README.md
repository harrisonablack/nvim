![](https://skillicons.dev/icons?i=neovim,linux,apple,lua,github)

# Neovim
This is my own personal Neovim config i use.

The config is split into 4 files, the root `init.lua` which calls `lua/nvim/plugins.lua`, `lua/nvim/settings.lua` and `lua/nvim/keymaps.lua`. The config is prioritised to be simple and readable.

I took inspiration from configs most recently like from [Sylvan "Vimothee" Franklin](https://www.youtube.com/watch?v=xGkL2N8w0H4) aswell as initially learning alot about configuring nvim from [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) and YouTubers like [The Primagen](https://www.youtube.com/watch?v=X6AR2RMB5tE).

## Installation and setup
> [!IMPORTANT]
> Neovim <=v0.12 is required for this config to work, as the config uses the newly built in vim.pack. nvim v0.12 is currently only available in the nightly branch which i am using [bob](https://github.com/MordechaiHadad/bob) to switch to and from

To install the config, clone the repo to your config folder, typically `~/.config/nvim`. Nvim will then prompt to install all plugins
```
git clone https://github.com/harrisonablack/nvim.git ~/.config/nvim && nvim
```

## Linters, LSP's, DSP's and formatters
[mason.nvim](https://github.com/williamboman/mason.nvim) is used to install LSPs, linters etc and as such can be installed using `:Mason`, or to get help `:help mason`
