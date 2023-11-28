vim.cmd([[
call plug#begin('~/.config/nvim')
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'projekt0n/github-nvim-theme'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4' }
call plug#end()
]])


vim.opt.number = true
vim.opt.hidden = true
vim.opt.cursorline = true
vim.opt.smartindent = true
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.ai = true
vim.opt.ignorecase = true
vim.opt.swapfile = false
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.clipboard = unnamed
vim.opt.hlsearch = false
vim.opt.laststatus = 0

vim.cmd([[
colorscheme github_dark_high_contrast
]])

local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<c-p>', telescope_builtin.find_files, {})
vim.keymap.set('n', '<c-g>', telescope_builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, {})
