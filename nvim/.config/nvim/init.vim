call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'liuchengxu/vista.vim'
Plug 'chrisbra/Colorizer'
call plug#end()

set hidden
set tabstop=8
set softtabstop=4
set shiftwidth=4
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
nnoremap <silent><nowait> <space><space>  :<C-u>Vista finder coc<cr>

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

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" COC Settings
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <TAB>
	    \ pumvisible() ? "\<C-n>" :
	    \ <SID>check_back_space() ? "\<TAB>" :
	    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>

" FZF Settings
nnoremap <c-p> :FZF<cr>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

colorscheme dracula

" COC vim extensions
let g:coc_global_extensions = [
	    \'coc-java',
	    \'coc-pyright',
	    \'coc-json',
	    \'coc-tsserver',
	    \'coc-clangd',
	    \'coc-html',
	    \'coc-rls'
	    \]

" Used for stuck language server
"CocCommand java.clean.workspace
"
"

let g:vista_fzf_preview = ['right:50%']

" unicode symbols
" let g:airline#extensions#whitespace#enabled = 0
" silent! call airline#extensions#whitespace#disable()

lua require('config')
