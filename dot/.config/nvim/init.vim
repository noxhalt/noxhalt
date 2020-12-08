" default
syntax on
scriptencoding utf8
filetype plugin indent on

set ambiwidth=double
set autochdir
set autoindent
set autoread
set autowrite
set clipboard=unnamedplus
set cmdheight=1
set encoding=utf8
set expandtab
set hlsearch
set ignorecase
set laststatus=1
set list
set listchars=tab:▸\ ,eol:¬
set modeline
set mouse=a
set nowrap
set number
set ruler
set scroll=0
set scrolljump=1
set scrolloff=0
set shiftwidth=2
set showcmd
set showmatch
set showtabline=1
set sidescroll=1
set sidescrolloff=1
set smartcase
set smartindent
set softtabstop=2
set splitbelow
set splitright
set tabstop=2
set termguicolors
set timeoutlen=50
set title
set virtualedit+=block

" plugin
if filereadable(fnamemodify($MYVIMRC, ':h').'/autoload/plug.vim')
  call plug#begin(fnamemodify($MYVIMRC, ':h').'/plug.d')
  Plug 'jiangmiao/auto-pairs' " auto close
  Plug 'vim-scripts/table_format.vim' " table spacing
  Plug 'scrooloose/nerdtree' " file manager
  Plug 'thinca/vim-localrc' " load local vimrc
  " Plug 'w0rp/ale' " linter
  Plug 'dracula/vim', { 'as': 'dracula' } " colorscheme
  Plug 'junegunn/fzf' " fzf
  Plug 'mattn/emmet-vim'
  Plug 'alvan/vim-closetag'
  Plug 'cespare/vim-toml'
  call plug#end()
  " configure
  colorscheme dracula
endif

" alias
command! -nargs=0 Reload so $MYVIMRC

" auto
autocmd VimResized * wincmd =

" keymap
