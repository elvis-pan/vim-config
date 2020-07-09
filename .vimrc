" The Vim Configuration of Elvis Pan
" For personal use only

" Basic configurations
syntax on
"set nocompatible
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
set nobackup
set nowritebackup

set cmdheight=2
set wildmenu
set scrolloff=5
set display+=lastline
set nomodeline
set noshowmode
set background=dark
set history=1000
set linespace=3
set updatetime=300
set shortmess+=c


" GUI setup
set guifont=Menlo:h15
if has('gui_running')
    set lines=45
    set columns=120
endif
set guioptions=

" Colorscheme
colorscheme elvis-space-vim
let g:airline_theme='base16_spacemacs'





"Set up Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" Git
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp':'vim/'}

" LaTeX
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'vim-latex/vim-latex'
Plugin 'lervag/vimtex'

" NERDTree
Plugin 'scrooloose/nerdtree'

" Auto Complete and parentheses
" Plugin 'Valloric/YouCompleteMe'
Plugin 'jiangmiao/auto-pairs'
Plugin 'luochen1990/rainbow'

" Statusline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'preservim/nerdcommenter'

" Syntax
Plugin 'sheerun/vim-polyglot'
Plugin 'vim-python/python-syntax'
" Plugin 'dense-analysis/ale'

" Start page
Plugin 'mhinz/vim-startify'

" Sidebar
Plugin 'liuchengxu/vista.vim'
" Plugin 'severin-lemaignan/vim-minimap'

" CoC
Plugin 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}

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
" Conflict between LaTeX-Box(vim-polyglot) and vimtex
let g:polyglot_disabled = ['latex']


" NERDTree
" Auto Enter NERDTree and windows size
if has('gui_running')
"    autocmd vimenter * NERDTree
"    autocmd vimenter * wincmd p
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
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_cache_omnifunc = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_filetype_blacklist = {
    \ 'tagbar' : 1,
    \ 'nerdtree' : 1,
    \}
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
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


" Vista
" Automatically get the nearest method or function
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

" Position at left
let g:vista_sidebar_position = 'vertical topleft'
let g:vista_sidebar_width = 30

" Quit if no other window left
autocmd bufenter * if winnr("$") == 1 && vista#sidebar#IsOpen() | execute "normal! :q!\<CR>" | endif

" Toggle Vista with <Ctrl>-v
map <C-v> :Vista!!<CR>

" Icons of vista
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "",
\   "variable": "",
\  }


"Airline
autocmd bufenter * let g:airline_exclude_preview = 0


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
        \ '  __________ /|         __       _______               ',
        \ '   \\  ____// | ____ __/_/_____ // ___ /_____________  ',
        \ '   || |____ | | || |/ /| |/ __/ || |_| ||__  \\ |__ /  ',
        \ '   ||  ____|| |_|| | / | |\__ \ || |___// _  || | | |  ',
        \ '   || |______\__/\\_/   \|/___/ || |    \____|\_| | |  ',
        \ '   \\_________/                 || |               \|  ',
        \ '                                ||/                    ',
        \ ]

" Fancy footer for Startify
let s:footer = [
        \ '+----------------------------------+',
        \ '|           Elvis Pan              |',
        \ '|    Carnegie Mellon University    |',
        \ '|                                  |',
        \ '|     My heart is in the work!     |',
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


" Rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['LightBlue', 'Cyan', 'DarkCyan', 'DarkGreen'],
\	'ctermfgs': ['LightBlue', 'Cyan', 'DarkCyan', 'DarkGreen'],
\	'guis': [''],
\	'cterms': [''],
\}




" Some useful shortcuts
" Spell check with <Ctrl>-s-c
map <C-s-c>: set spell!<CR>






" Coc configurations
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

autocmd FileType json syntax match Comment +\/\/.\+$+
