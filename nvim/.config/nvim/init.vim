call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'chrisbra/Colorizer'
Plug 'tpope/vim-fugitive'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'mfussenegger/nvim-jdtls'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'neovim/nvim-lspconfig'
call plug#end()

set hidden
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set scrolloff=8
set incsearch
set smartindent
set ai
set ignorecase
set cursorline
set noswapfile
set number
set clipboard=unnamed
set nohlsearch
set exrc
set mouse=a

"Double click space for doc outline
" Needed to have colors inside of TMUX
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" Make a new directory if requesting to make new nested file
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
	let dir=fnamemodify(a:file, ':h')
	if !isdirectory(dir)
	    call mkdir(dir, 'p')
	endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" FZF Settings
let $FZF_DEFAULT_COMMAND = 'ag --hidden -g ""'
nnoremap <c-p> :Files<cr>
nnoremap <c-g> :Ag<cr>

" LSP bindings
nnoremap gd :lua vim.lsp.buf.definition()<cr>
nnoremap gr :lua vim.lsp.buf.references()<cr>

" let $FZF_DEFAULT_COMMAND = 'ag -g ""'

colorscheme gruvbox

let g:fzf_preview_window = ['right:75%']

" unicode symbols
" let g:airline#extensions#whitespace#enabled = 0
" silent! call airline#extensions#whitespace#disable()

let g:coq_settings = { 'auto_start': 'shut-up'}

lua require('config')

augroup jdtls_lsp
    autocmd!
    autocmd FileType java lua require'ftplugin/java'
augroup end

" using pyright via lspconfig
lua require'ftplugin/python'


" autoformat java files before saving
autocmd BufWritePre *.java lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 1000)

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
