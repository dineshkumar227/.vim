call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sleuth'
Plug 'sheerun/vim-polyglot'
Plug 'lifepillar/vim-solarized8'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

let g:sleuth_automatic = 0
set background=dark
colorscheme dracula

set tabstop=8
set shiftwidth=8

set number relativenumber
syntax on
set mouse=a
filetype plugin indent on
set autoindent
set termguicolors
set laststatus=2
set incsearch
set hlsearch
set scrolloff=12
set ttyfast

set wrap
set textwidth=80
set colorcolumn=100
set formatoptions=crqnl

let mapleader = ","
nnoremap <tab> %
vnoremap <tab> %
nnoremap / /\v
vnoremap / /\v
nnoremap ; :
inoremap jj <ESC>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap j gj
nnoremap k gk
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>[ O<esc>j
nnoremap <leader>] o<esc>k
nnoremap <leader>v V` ]
map <silent> <Space> :noh<cr>
map <C-\> :vsp split<CR>:exec("tag ".expand("<cword>"))<CR>
cmap w!! w !sudo tee %
cmap hex %!xxd
cmap uhex %!xxd -r
set pastetoggle=<F2>

let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 25

:set statusline=%<%f%=\ [%1*%M%*%n%R%H]\ %-19(%3l,%02c%03V%)%O'%02b'
:hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red

" Check .git/tags for ctags file.
fun! FindTagsFileInGitDir(file)
  let path = fnamemodify(a:file, ':p:h')
  while path != '/'
    let fname = path . '/.git/tags'
    if filereadable(fname)
      silent! exec 'set tags+=' . fname
    endif
    let path = fnamemodify(path, ':h')
  endwhile
endfun

augroup CtagsGroup
  autocmd!
  autocmd BufRead * call FindTagsFileInGitDir(expand("<afile>"))
augroup END

autocmd BufEnter * silent! lcd %:p:h
