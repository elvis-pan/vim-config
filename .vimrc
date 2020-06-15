" The Vim Configuration of Elvis Pan
" For personal use only

" Basic configurations
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
set autoread
set wrap
set ruler
set showmatch
set noerrorbells
set vb t_vb=.
set laststatus=2

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
set scrolloff=5
set display+=lastline
set nomodeline
set noshowmode
set background=dark
set history=1000
set linespace=3

" GUI setup
set guifont=Menlo:h15
set transparency=8
set blur=10
if has('gui_running')
    set lines=40
    set columns=150
endif
set guioptions=

" Colorscheme
colorscheme elvis-space-vim
let g:airline_theme='base16_spacemacs'





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

Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'powerline/powerline'
Plugin 'preservim/nerdcommenter'
Plugin 'sheerun/vim-polyglot'
Plugin 'vim-python/python-syntax'
Plugin 'mhinz/vim-startify'
Plugin 'liuchengxu/vista.vim'
call vundle#end()

autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc


" Indentation
" C indentation style and syntax highlighting for c, c0, and c1 files
autocmd FileType c set cindent
autocmd FileType c setf c
autocmd FileType c set expandtab
au BufEnter *.c0 set cindent
au BufEnter *.c0 set expandtab
au BufRead,BufNewFile *.c0 set filetype=c0
au BufEnter *.c1 set cindent
au BufEnter *.c1 set expandtab
au BufRead,BufNewFile *.c1 set filetype=c0

" Python indentation style ...
autocmd FileType py set tabstop=4
autocmd FileType py set shiftwidth=4
autocmd FileType py set expandtab
autocmd FileType py setf python
autocmd BufEnter,BufRead,BufNewFile *.py    set iskeyword-=:
let g:python_highlight_all=1


" LaTeX setup
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
set sw=2
autocmd BufEnter,BufRead,BufNewFile *.tex   set iskeyword+=:
autocmd Filetype tex setl updatetime=1000
let g:livepreview_previewer='open -a Preview'



" NERDTree
" Auto Enter NERDTree and windows size
if has('gui_running')
    autocmd vimenter * NERDTree
    autocmd vimenter * wincmd p
    let g:NERDTreeWinSize=30
    let g:NERDTreeWinPos="right"
  else
    let g:NERDTreeWinSize=15
endif

" Entering NERDTree with <Ctrl>-n
map <C-n> :NERDTreeToggle<CR>
let NERDTreeMinimalUI=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" Highlighting of specific files
call NERDTreeHighlightFile('md', 'Yellow', 'none', 'Yellow', '#262626')



"You Complete Me
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
set completeopt=longest,menu
autocmd InsertLeave * if pumvisible() == 0 | pclose | endif
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <F6> :YcmForceCompileAndDiagnostics<CR>    "force recomile with syntastic
"nnoremap <leader>lo :lopen<CR>    "open locationlist
"nnoremap <leader>lc :lclose<CR>   "close locationlist
"inoremap <leader><leader> <C-x><C-o>
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_cache_omnifunc=0
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
let g:ycm_filetype_blacklist={
    \ 'tagbar' : 1,
    \ 'nerdtree' : 1,
    \}
let g:ycm_key_list_select_completion=['<Down>']
let g:ycm_key_list_previous_completion=['<Up>']
"let g:ycm_key_invoke_completion = '<M-;>'
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"let g:UltiSnipsListSnippets="<c-e>"
"let g:UltiSnipsSnippetDirectories=["bundle/vim-snippets/UltiSnips"]


" Terminal
" Set terminal size
set termwinsize=10x0

" Open terminal below with <Ctrl>-t
" Automatically open terminal below
map <C-t> :bel term<CR>

" Cursor style
" set guicursor

" Vista
" Automatically get the nearest method or function
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

" Position at left
let g:vista_sidebar_position='vertical topleft'
let g:vista_sidebar_width=30

" Quit if no other window left
autocmd bufenter * if winnr("$") == 1 && vista#sidebar#IsOpen() | execute "normal! :q!\<CR>" | endif

" Toggle Vista with <Ctrl>-v
map <C-v> :Vista!!<CR>


"Airline
autocmd bufenter let g:airline_exclude_preview=0


" Vim Startify
" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" list of startify
let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

" Fancy header for Startify
let s:header = [
        \ '        _          __             ',
        \ '  ___  | |   _   _/_/ ____   ____ ',
        \ ' / _ \ | |  | |/ /| |/ __/  / __ \',
        \ '|  __/ | |_ | | / | |\__ \  | ___/',
        \ ' \___|  \__||__/  |_||___/  | |   ',
        \ '                            |_|   ',
        \ '  My Heart is in the work!        ',
        \ ]

" Fancy footer for Startify
let s:footer = [
        \ '+----------------------------------+',
        \ '|           Elvis Pan              |',
        \ '|    Carnegie Mellon University    |',
        \ '+----------------------------------+',
        \ ]

" Position for Startify
" In middle, with NERDTree turned on
function! s:center(lines) abort
  let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
  let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", ((&columns - 30) / 2) - (longest_line / 2)) . v:val')
  return centered_lines
endfunction
let g:startify_custom_header = s:center(s:header)
let g:startify_custom_footer = s:center(s:footer)
