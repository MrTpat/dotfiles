vim.cmd([[
set hidden
set cursorline
set smartindent
set incsearch
set scrolloff=8
set ai
set ignorecase
set noswapfile
set number
colorscheme gruvbox
set clipboard=unnamed
set softtabstop=4
set shiftwidth=4
set nohlsearch
]])

vim.env.FZF_DEFAULT_COMMAND = 'ag -g ""'

vim.api.nvim_set_keymap(
"n",
"<c-p>",
":Files<cr>",
{ noremap = true }
)

return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use 'morhetz/gruvbox'

	use 'junegunn/fzf'
	use 'junegunn/fzf.vim'

end)
