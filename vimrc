let g:polyglot_disabled = ['tex']

call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'lervag/vimtex'
Plug 'jalvesaq/Nvim-R'
Plug 'dense-analysis/ale'
call plug#end()

colorscheme dracula

nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>

set number relativenumber
syntax on
set mouse=a
set ttyfast
filetype plugin indent on
set laststatus=2
set incsearch
set hlsearch
set scrolloff=12
set showcmd
set wildmenu
set wildmode=list:longest:full,full
set directory=~/.vim/swapfiles/

set textwidth=80
set colorcolumn=100
set formatoptions=crqnl1j

let mapleader = " "
inoremap jj <ESC>
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" : "\<TAB>"
nnoremap <tab> %
vnoremap <tab> %
nnoremap / /\v
vnoremap / /\v
nnoremap ; :
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap j gj
nnoremap k gk
"split and automatic move - Dinesh"
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>[ O<esc>j
nnoremap <leader>] o<esc>k
nnoremap <leader>v V` ]
"Copy for competitive programming - Ajay"
nnoremap <leader><leader>y gg"+yG
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy
vnoremap <leader>y "+y
map <silent> , :noh<cr>
"Help poor children in Uganda - Chinmay"
nnoremap <leader><leader>b :e#<cr>
nnoremap <leader>b :pop<cr>
cmap w!! w !sudo tee %
cmap Hex %!xxd
cmap Uhex %!xxd -r
cmap jj <ESC>
set pastetoggle=<F2>

let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 25
nnoremap <leader>l :Lex<cr>

:set statusline=%<%f%=\ [%1*%M%*%n%R%H]\ %-19(%3l,%02c%03V%)%O'%02b'
:hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red

autocmd BufEnter * silent! lcd %:p:h

let g:tex_flavor='latex'
let g:vimtex_compiler_method='latexmk'

let g:ale_completion_enabled = 1
nnoremap <silent> <F10> :ALEGoToDefinition<cr>
nnoremap <silent> <leader>d :ALEGoToDefinition<cr>
nnoremap <silent> <leader>r :ALERename<cr>
nnoremap <silent> <leader>i :ALEHover<cr>
