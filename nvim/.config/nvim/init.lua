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

vim.env.FZF_DEFAULT_COMMAND = 'ag --hidden -g ""'

vim.api.nvim_set_keymap(
"n",
"<c-p>",
":Files<cr>",
{ noremap = true }
)

-- file CONTENT only search, no file name
vim.cmd([[
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
]])

vim.api.nvim_set_keymap(
"n",
"<c-g>",
":Ag<cr>",
{ noremap = true }
)

return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use 'morhetz/gruvbox'

	use 'junegunn/fzf'
	use 'junegunn/fzf.vim'

end)
