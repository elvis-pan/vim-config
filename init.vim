
" The Vim Configuration of Elvis Pan
" For personal use only

" Basic configurations
syntax on
"set nocompatible
set encoding=utf-8
"set t_Co=256
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

" Toggle between relative number and no relative number
set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber 

set wildmenu
set scrolloff=5
set display+=lastline
set nomodeline
set noshowmode
set background=dark
set history=1000
set linespace=3

set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=yes

let g:Powerline_symbols='unicode'
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8


" GUI setup
if has('gui_running')
    set guifont=MesloLGS\ Nerd\ Font:h15
    set lines=40
    set columns=150
endif
set guioptions=

" Colorscheme
colorscheme one
" let g:airline_theme='one'
" colorscheme space-vim-dark
" let g:airline_theme='violet'
" colorscheme elvis-space-vim
let g:airline_theme='base16_spacemacs'


"Set up Vundle
"set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/plugged')
" Plug 'VundleVim/Vundle.vim'
" Git
Plug 'tpope/vim-fugitive'
Plug 'git://git.wincent.com/command-t.git'
Plug 'rstacruz/sparkup', {'rtp':'vim/'}

" LaTeX
" Plug 'xuhdev/vim-latex-live-preview'
Plug 'vim-latex/vim-latex'
Plug 'lervag/vimtex'

" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'


" Auto Complete and parentheses
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'

" Statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdcommenter'

" Syntax
" Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'
Plug 'numirias/semshi'
Plug 'arakashic/chromatica.nvim'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'jez/vim-better-sml'

" Start page
Plug 'mhinz/vim-startify'

" Sidebar
Plug 'liuchengxu/vista.vim'
Plug 'severin-lemaignan/vim-minimap'

" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plugin 'Valloric/YouCompleteMe' " Installing this is so hard

" Markdown
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app & yarn install'}

call plug#end()

autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc


" Indentation
" C indentation style and syntax highlighting for c, c0, and c1 files
" autocmd FileType c set cindent
" autocmd FileType c setf c
" autocmd FileType c set expandtab
autocmd FileType c set shiftwidth=4
" au BufEnter *.c0 set cindent
" au BufEnter *.c0 set expandtab
au BufRead,BufNewFile *.c0 set filetype=c0
" au BufEnter *.c1 set cindent
" au BufEnter *.c1 set expandtab
au BufRead,BufNewFile *.c1 set filetype=c0

" Python indentation style ...
autocmd FileType py set tabstop=4
autocmd FileType py set shiftwidth=4
autocmd FileType py set expandtab
autocmd FileType py setf python
autocmd BufEnter,BufRead,BufNewFile *.py    set iskeyword-=:


" LaTeX setup
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
set sw=2
autocmd BufEnter,BufRead,BufNewFile *.tex   set iskeyword+=:
autocmd Filetype tex setl updatetime=1000
let g:livepreview_previewer='open -a Preview'



" NERDTree
let g:NERDTreeWinSize=30
let g:NERDTreeWinPos="right"

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

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹ ",
    \ "Staged"    : "✚ ",
    \ "Untracked" : "✭ ",
    \ "Renamed"   : "➜ ",
    \ "Unmerged"  : "═ ",
    \ "Deleted"   : "✖ ",
    \ "Dirty"     : "✗ ",
    \ "Clean"     : "✔︎ ",
    \ 'Ignored'   : '☒ ',
    \ "Unknown"   : "? "
    \ }


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
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#enable_icon = 1






" Airline
autocmd bufenter * let g:airline_exclude_preview = 0
let g:airline_powerline_fonts = 1

" Symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''

" Tabline in Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
map <C-b>   :bnext<CR>




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
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
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
\	'separately': {
\		'nerdtree': 0,
\	}
\}




" Some useful shortcuts
" Spell check with <Ctrl>-s-c
map <C-s-c>: set spell!<CR>
map <C-a>: ALEToggle<CR>



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


" Python functions
syntax match pythonFunction /\v([^[:cntrl:][:space:][:punct:][:digit:]]|_)([^[:cntrl:][:punct:][:space:]]|_)*\ze(\s?\()/


" Auto-Pair Keymaps
let g:AutoPairsShortcutToggle = '<M-a>' " To avoid conflict with <Esc> to normal and p to paste


" CoC

" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1

augroup vimbettersml
  au!

  " ----- Keybindings -----

  au FileType sml nnoremap <silent> <buffer> <leader>t :SMLTypeQuery<CR>
  au FileType sml nnoremap <silent> <buffer> gd :SMLJumpToDef<CR>

  " open the REPL terminal buffer
  au FileType sml nnoremap <silent> <buffer> <leader>is :SMLReplStart<CR>
  " close the REPL (mnemonic: k -> kill)
  au FileType sml nnoremap <silent> <buffer> <leader>ik :SMLReplStop<CR>
  " build the project (using CM if possible)
  au FileType sml nnoremap <silent> <buffer> <leader>ib :SMLReplBuild<CR>
  " for opening a structure, not a file
  au FileType sml nnoremap <silent> <buffer> <leader>io :SMLReplOpen<CR>
  " use the current file into the REPL (even if using CM)
  au FileType sml nnoremap <silent> <buffer> <leader>iu :SMLReplUse<CR>
  " clear the REPL screen
  au FileType sml nnoremap <silent> <buffer> <leader>ic :SMLReplClear<CR>
  " set the print depth to 100
  au FileType sml nnoremap <silent> <buffer> <leader>ip :SMLReplPrintDepth<CR>

  " ----- Other settings -----

  " Uncomment to try out conceal characters
  "au FileType sml setlocal conceallevel=2

  " Uncomment to try out same-width conceal characters
  "let g:sml_greek_tyvar_show_tick = 1
augroup END
