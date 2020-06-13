syntax on
set nocompatible
set encoding=utf-8
set t_Co=256
set termguicolors
set number
set showmode
set mouse=a
set selection=exclusive

filetype on
filetype plugin on
filetype indent on
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set breakindent

set cursorline
"set cursorcolumn

set autoread
set wrap
set ruler
set showmatch
"set spell spelllang=en_us
set noerrorbells
set vb t_vb=.
set laststatus=2
" set textwidth=80

set title
set hlsearch
set ignorecase
set smartcase
set incsearch

set hidden
set clipboard=unnamed
set nostartofline
set nofoldenable
set backspace=indent,eol,start
set clipboard=unnamed
set relativenumber

set wildmenu
set scrolloff=1
set display+=lastline
set nomodeline
set noshowmode
set background=dark
set history=1000
set linespace=3
set guifont=Menlo:h15
"set guifont=SF_Mono:h14
set guioptions=
colorscheme space-vim-dark
"colorscheme onedark
"let g:lightline = {
"      \ 'colorscheme': 'one',
"      \ 'active': {
"      \   'left': [ [ 'mode', 'paste' ],
"      \             [ 'readonly', 'filename', 'modified'] ]
"      \ },
"      \ 'component': {
"      \   'gitbranch': 'FugitiveHead'
"      \ },
"      \ }
let g:airline_theme='base16_spacemacs'
"let g:airline_powerline_fonts=1






"C indentation style and syntax highlighting for c, c++, and c0 files
autocmd FileType c set cindent
autocmd FileType c setf c
autocmd FileType c set expandtab
"au BufEnter *.c0 setf c
au BufEnter *.c0 set cindent
au BufEnter *.c0 set expandtab
au BufRead,BufNewFile *.c0 set filetype=c0
au BufEnter *.c1 set cindent
au BufEnter *.c1 set expandtab
au BufRead,BufNewFile *.c1 set filetype=c0

"Python indentation style ...
autocmd FileType py set tabstop=4
autocmd FileType py set shiftwidth=4
autocmd FileType py set expandtab
autocmd FileType py setf python
autocmd BufEnter,BufRead,BufNewFile *.py    set iskeyword-=:

"Set up Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp':'vim/'}

Plugin 'xuhdev/vim-latex-live-preview'

Plugin 'scrooloose/nerdtree'

Plugin 'vim-latex/vim-latex'
Plugin 'lervag/vimtex'

Plugin 'Valloric/YouCompleteMe'
Plugin 'itchyny/lightline.vim'
Plugin 'rakr/vim-two-firewatch'
" Plugin 'liuchengxu/space-vim-dark'
"Plugin 'sillybun/vim-repl'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'powerline/powerline'
call vundle#end()

autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc

"LaTeX
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
set sw=2
set iskeyword+=:
autocmd Filetype tex setl updatetime=1000
let g:livepreview_previewer='open -a Preview'

"You Complete Me
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
set completeopt=longest,menu
autocmd InsertLeave * if pumvisible() == 0 | pclose | endif

"Auto Enter NERDTree
if has('gui_running')
    autocmd vimenter * NERDTree
    autocmd vimenter * wincmd p
    let g:NERDTreeWinSize = 40
else
    let g:NERDTreeWinSize = 20
endif
map <C-f> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"You Complete Me
"set completeopt=longest,menu
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif 
"inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
"inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
"inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
"inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <F6> :YcmForceCompileAndDiagnostics<CR>    "force recomile with syntastic
"nnoremap <leader>lo :lopen<CR>    "open locationlist
"nnoremap <leader>lc :lclose<CR>   "close locationlist
"inoremap <leader><leader> <C-x><C-o>
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf=0
"let g:ycm_cache_omnifunc=0
"let g:ycm_collect_identifiers_from_tags_files=1
"let g:ycm_collect_identifiers_from_comments_and_strings = 0
"let g:ycm_min_num_of_chars_for_completion=4
"let g:ycm_seed_identifiers_with_syntax=1
"let g:ycm_complete_in_comments = 1
"let g:ycm_complete_in_strings = 1
"let g:ycm_filetype_blacklist = {
"      \ 'tagbar' : 1,
"      \ 'nerdtree' : 1,
"      \}
"let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion = ['<Up>']
"let g:ycm_key_invoke_completion = '<M-;>'
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"let g:UltiSnipsListSnippets="<c-e>"
"let g:UltiSnipsSnippetDirectories=["bundle/vim-snippets/UltiSnips"]

" bracket


" Terminal
set termwinsize=10*80
cnoremap term bel term
