execute pathogen#infect()
syntax on
filetype on
filetype indent on
filetype plugin on

set wrap
set textwidth=80

:set number
:nmap j gj
:nmap k gk

:set incsearch
:set ignorecase
:set smartcase

set tabstop=4
set expandtab
set shiftwidth=4 
set smarttab

colorscheme monokai 

if has("autocmd")
    autocmd bufwritepost .vimrc source %
endif

set display+=lastline


inoremap {<CR> {<C-o>o}<C-o>O


function! My_Tab_Completion()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-P>"
    else
        return "\<Tab>"
endfunction
inoremap <Tab> <C-R>=My_Tab_Completion()<CR>


function! TEXSET()
    set makeprg=if\ \[\ -f\ \"Makefile\"\ \];then\ make\ $*;else\ if\ \[\ -f\ \"makefile\"\ \];then\ make\ $*;else\ pdflatex\ -file-line-error-style\ %\ &&\ evince\ %:r.pdf;fi;fi
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

autocmd FileType c call CSET()
autocmd FileType tex call TEXSET()
autocmd FileType python call PYSET()
