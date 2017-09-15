" ----------------------------------------------------------------------------
"   Plug
" ----------------------------------------------------------------------------

" Install vim-plug if we don't already have it
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'fholgado/minibufexpl.vim'
Plug 'majutsushi/tagbar'
Plug 'luochen1990/rainbow'
Plug 'vim-airline/vim-airline'
Plug 'rizzatti/dash.vim'

"snipmate
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

Plug 'editorconfig/editorconfig-vim'
Plug 'joonty/vdebug', {'for': ['php', 'python', 'ruby', 'perl']}
Plug 'valloric/youcompleteme', { 'do': './install.py' }
Plug 'mattn/emmet-vim', {'for': 'html'}
Plug 'othree/html5.vim', {'for': 'html'}
Plug 'scrooloose/syntastic'

Plug 'vim-pandoc/vim-pandoc', {'for': 'markdown'}
Plug 'vim-pandoc/vim-pandoc-syntax' , {'for': 'markdown'}

Plug 'vim-scripts/LargeFile'
Plug 'mxw/vim-jsx', {'for': 'javascript'}
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'tmhedberg/SimpylFold'
Plug 'rhysd/vim-grammarous', {'for': ['markdown', 'slide']}

Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/hgrev'

Plug 'mileszs/ack.vim'
Plug 'rosenfeld/conque-term', {'for': 'python'}
Plug 'jmcantrell/vim-virtualenv', {'for': 'python'}
Plug 'nelstrom/vim-visual-star-search'
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'zchee/vim-go-slide', {'for': 'slide'}

" Initialize plugin system
call plug#end()
