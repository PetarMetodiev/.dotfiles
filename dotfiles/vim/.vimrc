" Use Vim setting, rather than Vi settings (much better!)
set nocompatible

" Allow backspasing over everything in insert mode
set backspace=indent,eol,start

" Keep 1000 lines of command line history
set history=1000

" Show the cursor position all the time
set ruler

" Display incomplete commands
set showcmd

" Do incremental searching
set incsearch

" Always set autoindenting on
set autoindent

" ---------- Vundle specific settings ----------
" be iMproved, required
set nocompatible
" required
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

" Git wrapper
Plugin 'tpope/vim-fugitive'

" File explorer tree view
Plugin 'scrooloose/nerdtree'

" Automatic closing of quotes, paranthesis, brackets, etc.
Plugin 'raimondi/delimitmate'

" Statusline enhancements
Plugin 'bling/vim-airline'

" Plugin for easier navigation
Plugin 'easymotion/vim-easymotion'

" Wrap text in tags, braces, etc. or delete the surrounding tags, braces, tec .
Plugin 'tpope/vim-surround'

" Code snippets
Plugin 'SirVer/ultisnips'

" Snippet engine
Plugin 'honza/vim-snippets'

" Jade highlighting
Plugin 'digitaltoad/vim-pug'

" Commenting
Plugin 'tomtom/tcomment_vim'

" Vim autoformating, uses external formatters
Plugin 'Chiel92/vim-autoformat'

" Concealing for JS
Plugin 'pangloss/vim-javascript'

" Fuzzy file, buffer, mru, tag, etc. finder
Plugin 'ctrlpvim/ctrlp.vim'

" All of your Plugins must be added before the following line
" required
call vundle#end()
" required
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
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

" Display relative line numbers
set rnu
" Display absolute line numbers
set nu

" Turn on syntax highlighting
syntax enable

" Leave hidden buffers open
set hidden

"by default Vim saves your last 8 commands.  We can handle more
set history=100

set laststatus=2

" set ttimeoutlen=50

" Displaying the command line which keys are pressed
set showcmd

" No error bells
set visualbell
set t_vb=

" Open new horizontal split to the bottom
set splitbelow
" Open new vertical split to the right
set splitright

" Use tabs for identation instead of spaces, 1 tab = 4 spaces
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4

" Set the appearance of whitespace characters
set listchars=tab:»\ ,eol:¬,trail:·
" Turn on whitespace characters by default
set list

" Enable line numbers for NERDTree
let NERDTreeShowLineNumbers=1
" Use relative numbers for NERDTree
autocmd FileType nerdtree setlocal relativenumber

set t_Co=256
set background=dark
colorscheme distinguished

" Coloring for the whitespace characters
highlight NonText ctermfg=8

" Always show at least 2 visible lines above/below cursor
set scrolloff=2

" Show a list of suggestions above command line when pressing <Tab>
set wildmenu

" If a file is changed outside of Vim, it is automatically read again
set autoread

" Customizing the JS formatter
let g:formatdef_custom_js='"js-beautify -f - -tjaBC"'
let g:formatters_javascript=['custom_js']

" Customizing the HTML formatter
let g:formatdef_custom_html='"html-beautify -f - -t -A=force "'
let g:formatters_html=['custom_html']

" Customizing the CSS formatter
let g:formatdef_custom_css='"css-beautify -f - -tN"'
let g:formatters_css=['custom_css']

" CtrlP configuration
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"   \ 'file': '\v\.(exe|so|dll)$',
"   \ 'link': 'some_bad_symbolic_links',
"   \ }

" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" ---------- End of UI and UX settings ----------

" ---------- Key mappings ----------

" Insert empty space in normal mode
nnoremap <space> i<space><esc>

" Map Ctrl+b to open NERDTree. To close press <q>
map <C-b> :NERDTreeToggle<CR>

" Map Ctrl+/ to toggle comment
map <C-/> :TComment<CR>

" Map {{ to move to previous tab
nnoremap {{ :tabprevious<CR>

" Map }} to move to next tab
nnoremap }} :tabnext<CR>

" Map {T to open new tab
nnoremap {T :tabnew<CR>

" Move to lower split
noremap <C-j> <C-w><C-j>

" Move to upper split
noremap <C-k> <C-w><C-k>

" Move to left split
noremap <C-h> <C-w><C-h>

" Move to right split
noremap <C-l> <C-w><C-l>

" Map Ctrl+Shift+p to format code
noremap <C-P> :Autoformat<CR><bar>:w<CR>

" Map for toggling whitespace characters
nnoremap <leader>l :set list!<CR>

" Trigger configuration. Do not use <tab> if you use YouCompleteMe
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab><tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" ---------- End of key mappings ------
