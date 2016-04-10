set nocompatible " Use Vim setting, rather than Vi settings (much better!)

set backspace=indent,eol,start " Allow backspasing over everything in insert mode

set history=1000 " Keep 1000 lines of command line history

set ruler " Show the cursor position all the time

set showcmd " Display incomplete commands

set incsearch " Do incremental searching

set autoindent " Always set autoindenting on

" ---------- Vundle specific settings ----------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

Plugin 'tpope/vim-fugitive' " Git wrapper

Plugin 'scrooloose/nerdtree' " File explorer tree view

Plugin 'raimondi/delimitmate' " Automatic closing of quotes, paranthesis, brackets, etc.

Plugin 'bling/vim-airline' " Statusline enhancements

Plugin 'easymotion/vim-easymotion' " Plugin for easier navigation

Plugin 'tpope/vim-surround' " Wrap text in tags, braces, etc. or delete the surrounding tags, braces, tec .

Plugin 'SirVer/ultisnips' " Code snippets

Plugin 'honza/vim-snippets' " Snippet engine

Plugin 'digitaltoad/vim-pug' " Jade highlighting

Plugin 'tomtom/tcomment_vim' " Commenting

Plugin 'Chiel92/vim-autoformat' " Vim autoformating, uses external formatters

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" ---------- End of Vundle specific settings ----------

" ---------- UI and UX settings ----------

set rnu " Display relative line numbers
set nu " Display absolute line numbers

syntax enable " Turn on syntax highlighting

set hidden " Leave hidden buffers open

set history=100 "by default Vim saves your last 8 commands.  We can handle more

set laststatus=2

" set ttimeoutlen=50

set showcmd " Displaying the command line which keys are pressed

" No error bells
set visualbell
set t_vb=

set splitbelow " Open new horizontal split to the bottom
set splitright " Open new vertical split to the right

set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4 " Use tabs for identation instead of spaces, 1 tab = 4 spaces

set listchars=tab:»\ ,eol:¬,trail:· " Set the appearance of whitespace characters
set list " Turn on whitespace characters by default

let NERDTreeShowLineNumbers=1 " Enable line numbers for NERDTree
autocmd FileType nerdtree setlocal relativenumber " Use relative numbers for NERDTree


set t_Co=256
set background=dark
colorscheme distinguished
:highlight NonText ctermfg=8

" ---------- Key mappings ----------

:nnoremap <space> i<space><esc> " Insert empty space in normal mode

map <C-b> :NERDTreeToggle<CR> " Map Ctrl+b to open NERDTree. To close press <q>

map <C-/> :TComment<CR> " Map Ctrl+/ to toggle comment

nnoremap {{ :tabprevious<CR> " Map {{ to move to previous tab

nnoremap }} :tabnext<CR> " Map }} to move to next tab

nnoremap {T :tabnew<CR> " Map {T to open new tab

noremap <C-j> <C-w><C-j> " Move to lower split

noremap <C-k> <C-w><C-k> " Move to upper split

noremap <C-h> <C-w><C-h> " Move to left split

noremap <C-l> <C-w><C-l> " Move to right split

noremap <C-P> :Autoformat<CR> <bar> :update<CR> " Map Ctrl+Shift+p to format code

nnoremap <leader>l :set list!<CR> " Map for toggling whitespace characters

" Trigger configuration. Do not use <tab> if you use YouCompleteMe
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab><tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" ---------- End of key mappings ------
