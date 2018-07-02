set nocompatible		" required
filetype off			" required

" General text editing options
set nu				" show line numbers
set autoread
set autoindent                  " Indent according to previous line.
set expandtab                   " Use spaces instead of tabs.
set showcmd                     " show info on pressed leader key

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'

call vundle#end()
filetype plugin indent on       " required

syntax enable

" IncSearch settings
set incsearch
set hlsearch

" Turn on the Wild menu
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
" Show current position
set ruler

" A place for code snippets.
ab shebash #!/bin/bash -eu 
ab ipdb import ipdb; ipdb.set_trace()
