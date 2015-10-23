scriptencoding utf-8
set encoding=utf-8

" We don't want vi compatibility.
set nocompatible

" Use langauage-specific plugins and indentation rules.
filetype plugin indent on

" Enable the backspace key in insert mode See
" http://vim.wikia.com/wiki/Backspace_and_delete_problems
set backspace=indent,eol,start

" Appearance
colorscheme evening
set scrolloff=2

" Syntax highlighting should be on
syntax on

" Probably want to asssume a dark background.
set bg=dark

" Keep track of whitespace.
set list
set listchars=tab:â–,eol:$

" By default tabs are 2 characters, replace tabs with spaces.  These can be
" overwridden by language-specific files in the ftplugin directory.
set shiftwidth=2
set tabstop=2
set expandtab

" Automatic wrapping of comments at 80 characters, and put a gutter at a width
" of 80 characters.
set formatoptions+=c
set textwidth=80

" Ignore binary files in tab completion, Ctrl-P, etc.
set wildignore+=*.o,*.so,*.git/*,*.svn/*

" Correct filetypes for debian special files and markdown.
au BufNewFile,BufRead *.d set filetype=sh
au BufNewFile,BufRead *.md set filetype=markdown

" Make grep ignore common false positives - binary files (-I) and tags.
set grepprg=grep\ -nI\ --exclude\ 'tags'\ $*\ /dev/null\ --exclude-dir=.svn

" C formatting options
set cino=(0
set cinoptions+=g0

" Bash formatting options.
let is_bash=1

" Flod function arguments onto multiple lines.
function! FoldArgumentsOntoMultipleLines()
    substitute@,\s*@,\r@ge
    normal v``="
endfunction
nnoremap <leader>9 :call FoldArgumentsOntoMultipleLines()<CR>

" Search settings
set incsearch
set ignorecase
set smartcase

" Make j and k do the right thing on wrapped lines.
nmap j gj
nmap k gk

" Hightlight trailing whitespace and strip if needed.
match Todo /\s\+$/
nmap <leader>rtw :%s/\s*$//<CR>:noh<CR>
