" An example for a vimrc file.
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" ========== Vim Basic Settings ============="

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set modelines=0

" ========== Vundle settings ================"
let s:vundlerc = expand($HOME . '/.vim/vundle.vimrc')
if filereadable(s:vundlerc)
    exec ':so ' . s:vundlerc
endif

" set backup and swap options
set nobackup                    " back up current file, delete afterwards
set writebackup                 " back up current file, delete afterwards
set backupdir=~/.vim/tmp,/tmp,. " backups directory
set dir=~/.vim/tmp,/tmp,.       " swap directory

" set encodig for new files
set encoding=utf-8

" minimum number of screen lines above and below the cursor
set scrolloff=3

" Accerelate things up when working on a gnome-terminal
set scrolljump=5

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=100		" keep 100 lines of command line history
set matchpairs+=<:>	" match to be used witrh %

" ruler bar options
set ruler			" show the cursor position all the time
set showcmd			" display incomplete commands
set laststatus=2

set ttyfast "enable fast scrolling

"activate the show mode
set showmode

" search options
set ignorecase
set smartcase       " if the search string has a upper case character do the search case sensitive
set incsearch		" do incremental searching

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" tab space configuration
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" html space configuration
autocmd Filetype html setlocal ts=2 sts=2 sw=2

set nowrap

"set undofile
set shell=/bin/bash
set lazyredraw
set matchtime=3

"Changing Leader Key
let mapleader = ","

" Set title to window
set title

" Dictionary path, from which the words are being looked up.
set dictionary=/usr/share/dict/words

" Make pasting done without any indentation break."
set pastetoggle=<F3>

" Make Vim able to edit corntab fiels again.
set backupskip=/tmp/*,/private/tmp/*"

" Mouse support even on terminals (in all modes)
set mouse=a

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Hack for desabling bells and flashes.
autocmd VimEnter * set vb t_vb= 

" search column 80 characters and highlight them
autocmd BufNewFile,BufRead,WinEnter,BufEnter,FileType python,*.py,javascript,*.js,c,*.c,cpp,*.cpp,*.m,objc,*.h,cs,*.cs,*.md let w:m2=matchadd('ErrorMsg', '\%<81v.\%>80v', -1)

" Compiler profile for c#
au FileType cs compiler gmcs

" we don't need matlab so associate *.m files with Objective-C syntax
" highlighting
let filetype_m='objc'
"au BufNewFile,BufRead *.m setf objc

" correcting the filetype for html filier
autocmd FileType html set ft=htmldjango.html " For SnipMate
autocmd FileType htmldjango set ft=htmldjango.html " For SnipMate


" Don't use Ex mode, use Q for formatting
map Q gq

" jquery.vim syntax
" au BufRead,BufNewFile *.js set ft=javascript syntax=jquery


" GUI options
if has("gui_running")
    set guifont=Monospace\ 12
    let g:winManagerWindowLayout = "FileExplorer,TagsExplorer"
    let g:TagBase_CleanUp = '2'

    " For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
    " let &guioptions = substitute(&guioptions, "t", "", "g")

    " Remove menus and guioptions
    aunmenu *
    set guioptions-=m
endif

" Get Rid of stupid Goddamned help keys
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Adding More Shorcuts keys using leader kye.
" Leader Kye provide separate namespace for specific commands.
",W Command to remove white space from a file.
nnoremap <leader>W :%s/\s\+//g<cr>:let @/=''<CR>

" ,ft Fold tag, helpful for HTML editing.
nnoremap <leader>ft vatzf

" ,q Re-hardwrap Paragraph
nnoremap <leader>q gqip

" ,v Select just pasted text.
nnoremap <leader>v V`]

" ,ev Shortcut to edit .vimrc file on the fly on a vertical window.
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" clean the search
nnoremap <leader>h :noh<cr>

" enables wildmenu (show autocompleted terms in the bar)
set wildmenu
"set wildmode=list:longest
set wildignore+=.hg,.git,.svn " Version Controls"
set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Binary Imgs"
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files"
set wildignore+=*.spl "Compiled speolling world list"
set wildignore+=*.sw? "Vim swap files"
set wildignore+=*.DS_Store "OSX SHIT"
set wildignore+=*.luac "Lua byte code"
set wildignore+=migrations "Django migrations"
set wildignore+=*.pyc "Python Object codes"
set wildignore+=*.orig "Merge resolution files"

" =========== END Basic Vim Settings ===========

" Removing scrollbars
if has("gui_running")
    set guitablabel=%-0.12t%M
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guioptions+=a
    set guioptions+=m
    colo badwolf
    "set listchars=tab:▸\ ,eol:¬         " Invisibles using the Textmate style
endif

" Source the vimrc file after saving it
autocmd bufwritepost .vimrc source ~/.vimrc

" Markdown settingd
"
augroup Formatting
    autocmd!
    autocmd BufNewFile,BufRead,WinEnter,BufEnter,FileType markdown,*.md,*.mkd setlocal formatoptions=ant textwidth=68 wrapmargin=0
augroup END

"switch spellcheck languages
let g:myLang = 0
let g:myLangList = [ "nospell", "es", "es_PE", "en_us" ]
function! MySpellLang()
  "loop through languages
  let g:myLang = g:myLang + 1
  if g:myLang >= len(g:myLangList) | let g:myLang = 0 | endif
  if g:myLang == 0 | set nospell | endif
  if g:myLang == 1 | setlocal spell spelllang=es | endif
  if g:myLang == 2 | setlocal spell spelllang=es_PE | endif
  if g:myLang == 3 | setlocal spell spelllang=en_us | endif
  echo "language:" g:myLangList[g:myLang]
endf

map <F7> :call MySpellLang()<CR>
imap <F7> <C-o>:call MySpellLang()<CR>

" ========== END Gvim Settings ==========


" ========== Plugin Settings =========="

" Mapping to NERDTree
nnoremap <leader>n :NERDTreeToggle<cr>

" Mini Buffer some settigns."
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" Rope settings."
let g:ropevim_open_files_in_tabs = 0
imap <leader>j <ESC>:RopeGotoDefinition<cr>
nmap <leader>j <ESC>:RopeGotoDefinition<cr>

" ropevim (Python-only) options
let ropevim_vim_completion=1
let ropevim_extended_complete=1

" Tagbar key bindings."
nmap <leader>l <ESC>:TagbarToggle<cr>
imap <leader>l <ESC>:TagbarToggle<cr>i

" Rainbow
let g:rainbow_active = 0
nmap <leader>r <ESC>::RainbowToggle<cr>
imap <leader>r <ESC>::RainbowToggle<cr>i

"Vim airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" Ctags goTodefinition. (see youcompleteme)"
"imap <leader>k <ESC><C-]>
"nmap <leader>k <ESC><C-]>

" CtrlP settings"
let g:ctrlp_map = '<c-t>'
let g:ctrlp_cmd = 'CtrlP'

" Dash settings
:nmap <silent> <leader>d <Plug>DashSearch

let g:dash_map = {
    \ 'javascript'   : 'web_js',
    \ 'python'   : 'python_fw'
    \ }

" Snipmate settings

:imap <C-J> <Plug>snipMateNextOrTrigger
:smap <C-J> <Plug>snipMateNextOrTrigger

" Editorconfig settings
let g:EditorConfig_max_line_indicator = 'none'
let g:EditorConfig_preserve_formatoptions = 1

"" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" vdebug settings
let g:vdebug_options = {}
let g:vdebug_options["port"] = 9000
let g:vdebug_options["break_on_open"] = 0
let g:vdebug_keymap = {
\    "run" : "<Leader>/",
\    "run_to_cursor" : "<Down>",
\    "step_over" : "<Up>",
\    "step_into" : "<Left>",
\    "step_out" : "<Right>",
\    "close" : "q",
\    "detach" : "x",
\    "set_breakpoint" : "<Leader>p",
\    "eval_visual" : "<Leader>e"
\}

" youcompleteme and omnicomplete

set omnifunc=syntaxcomplete#Complete
" Call YCM GoTo or vim-go GoTo depending on file type. 
function! GoToDef()
    if &ft == 'go'
        "call go#def#Jump()
        execute 'GoDef'
    else
        execute 'YcmCompleter GoTo'
    endif
endfunction

imap <leader>k <ESC>:call GoToDef()<CR>
nmap <leader>k <ESC>:call GoToDef()<CR>

"syntastic
"
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
"let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
"
"Pandoc
nnoremap <leader>cow :Pandoc! docx<CR>


" =========== END Plugin Settings =========="

set t_Co=256
syntax enable
colorscheme xoria256
"set background=dark
"colorscheme solarized
"colorscheme sift
"colorscheme desert

" ========== Private settings ================"
let s:extrarc = expand($HOME . '/.extra.vimrc')
if filereadable(s:extrarc)
    exec ':so ' . s:extrarc
endif
" ========== Other settings ================"
let s:otherrc = expand($HOME . '/.vim/other.vimrc')
if filereadable(s:otherrc)
    exec ':so ' . s:otherrc
endif

au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" ============neovim========================"
