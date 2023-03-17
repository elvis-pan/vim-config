syntax on
set mouse=a
set number
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set cursorline
set showmatch
set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber 
set scrolloff=5
