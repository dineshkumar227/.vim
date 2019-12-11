call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sleuth'
Plug 'sheerun/vim-polyglot'
Plug 'lifepillar/vim-solarized8'
call plug#end()

let g:sleuth_automatic = 0

set number
syntax on
set mouse=a
set tabstop=8
set shiftwidth=8
filetype plugin indent on
set autoindent
set termguicolors
set laststatus=2
set incsearch
set hlsearch
set scrolloff=12
set background=dark
colorscheme solarized8

let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 25
map <silent> <Space> :noh<cr>

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

map <C-\> :vsp split<CR>:exec("tag ".expand("<cword>"))<CR>

