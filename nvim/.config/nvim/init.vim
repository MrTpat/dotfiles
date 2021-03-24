call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'tpope/vim-fugitive'
Plug 'uiiaoo/java-syntax.vim'
Plug 'vim-airline/vim-airline'
call plug#end()
let mapleader=" "
nnoremap <SPACE> <Nop>
nnoremap <c-p> :FZF<cr>
set cursorline
set noswapfile
set number
set termguicolors     " enable true colors support
set paste
"colorscheme dracula
set clipboard=unnamed
augroup Yank
	autocmd!
	autocmd TextYankPost * :call system('clip.exe ',@")
augroup END
tnoremap <Esc> <C-\><C-n>
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
set nohlsearch
if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
set hidden
set tabstop=4 softtabstop=4
set smartindent
set scrolloff=8
set incsearch
set smartindent
set ai
set ignorecase
let g:airline_theme='dracula'
