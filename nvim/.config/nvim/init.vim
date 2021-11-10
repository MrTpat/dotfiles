call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'chrisbra/Colorizer'
Plug 'tpope/vim-fugitive'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'beeender/Comrade'
call plug#end()
let g:deoplete#enable_at_startup = 1

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
" below line prevents file names from showing up when calling Ag
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
nnoremap <c-g> :Ag<cr>


nnoremap <space><space> :ComradeFix<cr>

colorscheme gruvbox

let g:fzf_preview_window = ['right:75%']

" unicode symbols
" let g:airline#extensions#whitespace#enabled = 0
" silent! call airline#extensions#whitespace#disable()

lua require('config')

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction


" open fzf res into quickfix list with ctrla ctrlq
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
