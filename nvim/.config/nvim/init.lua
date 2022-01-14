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
]])

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'morhetz/gruvbox'

end)
