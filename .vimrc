" These must be first, because they change other options as a side effect.
scriptencoding utf-8
set nocompatible
execute pathogen#infect()


" ========== Behavior ============

let mapleader=","
set encoding=utf-8              "UTF8 everywhere
set backspace=indent,eol,start  "Fix backspace not working "
set history=1000                "Store lots of :cmdline history

"Clear last search
nmap <C-c>c :let<space>@/=""<CR>
set hlsearch                    "Hilight searches by default
set incsearch                   "Find the next match as we type the search

" save swap file to this directory, instead of the current one
set directory=~/.vim/swp//


" ================  Display  ========================

set ls=2             "Always display statusline filename at bottom
set nowrap           "Don't wrap lines
set linebreak        "Wrap lines at convenient points

set number           "Display line number
set showcmd          "Show incomplete cmds down the bottom
set showmode         "Show current mode down the bottom
set gcr=a:blinkon0   "Disable cursor blink
set visualbell       "No sounds
set autoread         "Reload files changed outside vim

" PEP8 guideline
autocmd Filetype python setlocal set colorcolumn=81

" colorscheme
set t_Co=256
let g:molokai_original = 0
colorscheme molokai


" ================ Indentation ======================

" Indent behavior
set smarttab
set expandtab
set smartindent
set autoindent
set softtabstop=4  shiftwidth=4  tabstop=4
autocmd BufRead,BufNewFile *.ctp setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2

"Display tabs and trailing spaces visually
set list
set listchars=tab:\ \ ,trail:·

" Delete spaces in empty lines on save
autocmd BufWritePre * :%s/\s\+$//e


" ========= Path completion =======

set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildmode=list:longest
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif


" =========== Plugins settings ========

" gitGutter config
highlight clear SignColumn
set updatetime=1000

" indent guide
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=234

" NERDtree
map <C-n> :NERDTreeToggle<CR>

" NERDCommenter, Ctrl+/ to toggle comments
map <C-_> <leader>c<space>

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" ============== Key mapping ===========

" Shift+Tab unindents a line "
nmap <S-tab> <<

" exit insert mode with jk
inoremap jk <esc>

" delete something, don't cut it
nnoremap <leader>d "_d
vnoremap <leader>d "_d
vnoremap <leader>p "_dP

" duplicate a line
nnoremap <C-D> yyp
