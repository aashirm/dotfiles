" Vundle initialization
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
" Plugin 'scrooloose/syntastic'

call vundle#end()

" basic configuration
filetype plugin indent on
syntax on

colorscheme monokai

set encoding=utf8
set backspace=indent,eol,start

" line options
set number
set ruler
set wrap

" splitting defaults
set splitbelow
set splitright 

" intuitive cursor movement
nmap j gj
nmap k gk

" nice search defaults
set smartcase
set incsearch
set hlsearch

" spacing settings
set tabstop=4
set expandtab
set shiftwidth=4 
set smarttab

" sources vimrc after write
if has("autocmd")
    autocmd bufwritepost .vimrc source %
endif

" display long lines
set display+=lastline

" clears and redraws screen after hl search
nnoremap <silent> <C-l> :nohl<CR><C-l>

" maps jk to esc
inoremap jk <Esc>

" tab completion within file
" found at http://people.ksp.sk/~misof/programy/vimrc.html
function! My_Tab_Completion()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-P>"
    else
        return "\<Tab>"
endfunction
inoremap <Tab> <C-R>=My_Tab_Completion()<CR>

" default options for making from vim
function! TEXSET()
    set makeprg=if\ \[\ -f\ \"Makefile\"\ \];then\ make\ $*;else\ if\ \[\ -f\ \"makefile\"\ \];then\ make\ $*;else\ pdflatex\ -file-line-error-style\ %\ &&\ open\ %:r.pdf\ &&\ change_focus\;fi;fi
    set errorformat=%f:%l:\ %m
endfunction

function! PYSET()
    set makeprg=if\ \[\ -f\ \"Makefile\"\ \];then\ make\ $*;else\ if\ \[\ -f\ \"makefile\"\ \];then\ make\ $*;else\ python\ %;fi;fi
    set smartindent
    set tw=0
endfunction

function! CSET()
    set makeprg=if\ \[\ -f\ \"Makefile\"\ \];then\ make\ $*;else\ if\ \[\ -f\ \"makefile\"\ \];then\ make\ $*;else\ gcc\ -O2\ -Wall\ -o%.bin\ %\ &&\ ./%.bin;fi;fi
    set errorformat=%f:%l:\ %m
    set cindent
    set tw=0
endfunction

" call correct make function
autocmd FileType c call CSET()
autocmd FileType tex call TEXSET()
autocmd FileType python call PYSET()

" custom tabbing for specific filetypes
autocmd FileTYpe html setlocal shiftwidth=2 tabstop=2
autocmd FileType json setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
