" Set encoding first in order to avoid any character mismatches further on
set encoding=utf-8

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

" Search is case insensitive
set ignorecase
set smartcase

" Always set autoindenting on
set smartindent
set autoindent
set copyindent

"Highlight searches
set hlsearch

" Tell vim to keep a backup file
set backup

" Tell vim where to put its backup files
set backupdir=~/.vim/backup/

" Tell vim where to put swap files
set dir=~/.vim/backup/

" persist undos
set undofile
set undodir=~/.vim/undo/

" ---------- Vundle specific settings ----------

" be iMproved, required
set nocompatible

" required
filetype off

" set rtp+=$HOME/vimfiles/custom-snippets/

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

" Git wrapper
Plugin 'tpope/vim-fugitive' " UNUSED / usefull for displaying current branch

" File explorer tree view
Plugin 'scrooloose/nerdtree'

" Automatic closing of quotes, paranthesis, brackets, etc.
Plugin 'raimondi/delimitmate'

" Statusline enhancements
Plugin 'vim-airline/vim-airline'

" Plugin for easier navigation
" Plugin 'easymotion/vim-easymotion'

" Wrap text in tags, braces, etc. or delete the surrounding tags, braces, tec .
Plugin 'tpope/vim-surround'

" Use tab for insert completion
Plugin 'ervandew/supertab'

" Highlight yanked text
Plugin 'machakann/vim-highlightedyank'

" Code snippets
Plugin 'SirVer/ultisnips'

" Snippet engine.
Plugin 'honza/vim-snippets'

" Jade highlighting
" Plugin 'digitaltoad/vim-pug' " UNUSED

" Commenting
Plugin 'tomtom/tcomment_vim'

" Integration with editorconfig
Plugin 'editorconfig/editorconfig-vim'

" Vim autoformating, uses external formatters
Plugin 'Chiel92/vim-autoformat'

" Concealing for JS
Plugin 'pangloss/vim-javascript'

" JS syntax highlighting
Plugin 'jelera/vim-javascript-syntax'

" Fuzzy file, buffer, mru, tag, etc. finder
Plugin 'ctrlpvim/ctrlp.vim'

" Airline themes
Plugin 'vim-airline/vim-airline-themes'

" Highlight enclosing html tags
Plugin 'Valloric/MatchTagAlways'

" Autocomplete
" Plugin 'Valloric/YouCompleteMe'

" Static code analysis
" Plugin 'scrooloose/syntastic'

" Code linter/fixer, should work async
Plugin 'w0rp/ale'

" Search tool wrapper
Plugin 'mileszs/ack.vim'

" Insert or delete brackets, automatically add new lines between brackets
Plugin 'jiangmiao/auto-pairs'

" Typescript syntax
Plugin 'leafgarland/typescript-vim'

" Highlighting HTML templates inside typescript and javascript
" Plugin 'Quramy/vim-js-pretty-template' " Removed due to some confilcts and wasnt using it after all

" Interactive command execution
" Plugin 'Shougo/vimproc.vim'

" Typescript IDE likeness
Plugin 'Quramy/tsuquyomi'

" Omnicompletion with official support for windows
Plugin 'Shougo/neocomplete.vim'

" The vim source for neocomplete
Plugin 'Shougo/neco-vim'

" Multiple language identation and highlighting support
" Plugin 'sheerun/vim-polyglot'

" Syntax support for JSON
Plugin 'elzr/vim-json'

" Syntax for different javascript libraries
" Plugin 'othree/javascript-libraries-syntax.vim'

" Autocomplete for JS
" Plugin 'ternjs/tern_for_vim'

" Snippets for Angular 2. Works with snipmate only
" Plugin 'mhartington/vim-angular2-snippets'

" Local .vimrc file
" Plugin 'embear/vim-localvimrc' " UNUSED

" Custom splash screen
" Plugin 'mhinz/vim-startify' " UNUSED

" Color hex codes and color names
Plugin 'chrisbra/Colorizer'

" Place items in braces on new row each
Plugin 'FooSoft/vim-argwrap'
"
" TypeScript syntax highlighting
Plugin 'HerringtonDarkholme/yats.vim'

" Session management
" Plugin 'tpope/vim-obsession'

" Vim understands .tmux.conf¬
Plugin 'tmux-plugins/vim-tmux'

" Make autoread work in tmux¬
Plugin 'tmux-plugins/vim-tmux-focus-events'

" Needed for proper icons with nerd fonts
Plugin 'ryanoasis/vim-devicons'

" Automatically :set paste! when inserting text from outside vim(e.g.
" shift+insert)
Plugin 'ConradIrwin/vim-bracketed-paste'

" Automatically close html tags
Plugin 'alvan/vim-closetag'
" Themes
Plugin 'flazz/vim-colorschemes'
Plugin 'rafi/awesome-vim-colorschemes'


" All of your Plugins must be added before the following line
" required
call vundle#end()

" required
filetype plugin indent on

" ---------- End of Vundle specific settings ----------

" ---------- UI and UX settings ----------

runtime macros/matchit.vim

" Autocompletion
" set omnifunc=syntaxcomplete#Complete
" set omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

set t_Co=256
set background=dark
colorscheme distinguished
" colorscheme Benokai
" colorscheme DevC++
" colorscheme Light
" colorscheme af
" colorscheme bubblegum
" colorscheme landscape
" highlight NonText ctermfg=8 guifg=#4d4d4d

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

" Status line is always shown
set laststatus=2

" Do not show the mode (-- INSERT --) at the bottom
set noshowmode

" set ttimeoutlen=50

" Displaying the command line which keys are pressed
set showcmd

" No error bells
set noerrorbells
set t_vb=
set visualbell t_vb=

" Make search/replace global by default
set gdefault

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

" Do not continue comment using o or O
set formatoptions-=o

" No // when joining commented lines
set formatoptions+=j

" Mouse support(clicking, scrolling, selecting panes)
set mouse=a

" Share clipboard with system
set clipboard+=unnamed

" Ato-resize splits when VIM is resized(e.g. open new split in tmux)
autocmd VimResized * :wincmd =

" Zoom split(similar to tmux zooming to pane)
nnoremap <leader>z :wincmd _<CR>:wincmd \|<CR>
nnoremap <leader>zz :wincmd =<CR>

" Enable line numbers for NERDTree
let NERDTreeShowLineNumbers=1
" NERDTree file sorting
let g:NERDTreeSortOrder=['\/$', '\.html$', '\.js$', '*',  '\~$']
" Use relative numbers for NERDTree
autocmd FileType nerdtree setlocal relativenumber
" Show NERDTree bookmarks by default
let g:NERDTreeShowBookmarks=1
" Fix for not loading files sometimes - https://github.com/scrooloose/nerdtree/issues/587
let NERDTreeIgnore=['\c^ntuser\..*']
" Show hidden files
let NERDTreeShowHidden=1

" Customizing html formatter - should use tabs instead of spaces and force
" attributes on new lines
let g:formatdef_custom_html = '"html-beautify -f - -t -A=force-aligned"'
let g:formatters_html = ['custom_html']

" Cusomizing js formatter - should use tabs instead of spaces, enable jslint
" stricter mode, add space before function's parens, break chained method
" calls, put commas at the beginning of new line instead of end
let g:formatdef_custom_js = '"js-beautify -f - -tjaBC"'
let g:formatters_javascript = ['custom_js']

" Customizing the CSS formatter
let g:formatdef_custom_css='"css-beautify -f - -tN"'
let g:formatters_css=['custom_css']

" Customizing the ts formatter
let g:formatdef_custom_ts='"tsfmt"'
let g:formatters_ts = ['custom_ts']

" CtrlP configuration
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Always show at least 10 visible lines above/below cursor
set scrolloff=10

" Show a list of suggestions above command line when pressing <tab>
set wildmenu

" If a file is changed outside of Vim, it is automatically read again
set autoread

" Highlights the current line
set cursorline

" Display function signatures in the completion menu
" set updatetime=500
" let g:tern_show_argument_hints = 'on_move'
" let g:tern_show_signature_in_pum=1

" Show shortened filename path in vim-airline -> \d\c\d\t\f\file.js
let g:airline#extensions#tabline#fnamemod = ':t'

" ALE integration with airline
let g:airline#extensions#ale#enabled = 1
" Disable ALE highlighting. When writting it keeps highlighting on and gets in
" the way
let g:ale_set_highlights = 0
" For .ts files use only tslint, as eslint could be installed sometimes but
" not-configured properly
let g:ale_linters = {
\   'typescript': ['tslint'],
\}

" Change the working directory to the currently open file
set autochdir

" Remember las position when reopening a file
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" No error in airline for white spaces - something anyway useless and takes too much space
let g:airline_section_warning = 0

" Display open buffers in airline
let g:airline#extensions#tabline#enabled = 1

" Use Airline special symbols
let g:airline_powerline_fonts=1

" Airline theme
let g:airline_theme='papercolor'

" NERDTree symbols
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Syntastic default settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" Set duration of highlighting when yanking
let g:highlightedyank_highlight_duration = 300

" the_silver_searcher (Ag) integration with ack
let g:ackprg = 'ag --vimgrep'

" Folding based on the syntax of the used language
" set foldmethod=syntax
" Start at some unfolded position
" set foldlevelstart=4
" Disable folding
set nofoldenable

" Tsuquyomi configuration
" autocmd FileType typescript setlocal balloonexpr=tsuquyomi#balloonexpr()
let g:tsuquyomi_single_quote_import = 1
let g:tsuquyomi_use_dev_node_module = 0
let g:tsuquyomi_use_local_typescript = 0
" Import shortest path instead of complete one, usefull for es6 imports with bundlers
let g:tsuquyomi_shortest_import_path = 1
" Show method signature - may be slow
let g:tsuquyomi_completion_detail = 1
" Show additional information about symbol below the cursor
" https://github.com/Quramy/tsuquyomi/blob/master/doc/tsuquyomi.txt#L467
autocmd FileType typescript nmap <buffer> <Leader>tt :
		\ <C-u>echo tsuquyomi#hint()<CR>

" typescript-vim configuration
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
" autocmd QuickFixCmdPost [^l]* nested cwindow
" autocmd QuickFixCmdPost    l* nested lwindow
autocmd FileType typescript :set makeprg=tsc

" " vim-js-pretty-template (highlighting HTML in ts and js) configuration
" autocmd FileType typescript JsPreTmpl html
" autocmd FileType typescript syn clear foldBraces

" Tsuquyomi integration with syntastic
let g:tsuquyomi_disable_quickfix = 1
" let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']
" let g:syntastic_typescript_checkers = ['tsc', 'tslint']

" HTML5 for syntastic
" let g:syntastic_html_tidy_exec = 'tidy5'

" Neocomplete configuration
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Integration with Tsuquyomi
autocmd BufRead,BufNewFile *.ts,*.d.ts setlocal filetype=typescript
autocmd BufRead,BufNewFile *.tsx setlocal filetype=typescript
autocmd FileType typescript setlocal completeopt+=menu
if !exists('g:neocomplete#force_omni_input_patterns')
	let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.typescript = '[^. *\t]\.\w*\|\h\w*::'
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 1
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
			\ 'default' : '',
			\ 'vimshell' : $HOME.'/.vimshell_hist',
			\ 'scheme' : $HOME.'/.gosh_completions'
			\ }
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
	" For no inserting <CR> key.
	"return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" AutoComplPop like behavior.
" let g:neocomplete#enable_auto_select = 1
" Enable omni completion.
if !exists('g:neocomplete#force_omni_input_patterns')
	let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
if !exists('g:neocomplete#sources#omni#functions')
	let g:neocomplete#sources#omni#functions = {}
endif

" Trigger configuration. Do not use <tab> if you use YouCompleteMe
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Disable keybindings for auto-pairs - https://github.com/jiangmiao/auto-pairs#shortcuts
let g:AutoPairsShortcutToggle = ""

" Configure Local .vimrc
" let g:localvimrc_whitelist = 'D:\\Work\\LiveChat\\LiveChat\\Source\\LiveChat\\Client\\LiveChat.Client\\.lvimrc'

" Configure custom start screen

" Fix extra closing '>' when using vim-closetag with delimitMate
let delimitMate_matchpairs ="(:),[:],{:}"

" ---------- End of UI and UX settings --------

" ---------- Key mappings ----------

" Quick error navigation
nnoremap <leader>n :lnext<CR>
nnoremap <leader>p :lprevious<CR>
nnoremap <leader>c :lclose<CR>

" Open vimrc
nnoremap <leader>e :e $MYVIMRC<CR>

" Insert empty space in normal mode
nnoremap <space> :

" Map Ctrl+b to open NERDTree. To close press <q>
map <C-b> :NERDTreeToggle<CR>

" Map Ctrl+/ to toggle comment
" map <C-/> :TComment<CR>

" Map {{ to move to previous buffer
nnoremap {{ :bprevious<CR>

" Map }} to move to next buffer
nnoremap }} :bnext<CR>

" Map {T to open new buffer
nnoremap {T :enew<CR>

" Close the current buffer and move to the previous one
" This repicates the idea of closing a tab
nnoremap {X :w<bar>:bp<bar>bd #<CR>

" Show all open buffers and their status
nnoremap {} :ls<CR>

" Move to lower split
noremap <C-j> <C-w><C-j>

" Move to upper split
noremap <C-k> <C-w><C-k>

" Move to left split
noremap <C-h> <C-w><C-h>

" Move to right split
noremap <C-l> <C-w><C-l>

" Map Ctrl+Shift+f to format code; No spacing between the lines because it adds spaces
noremap <C-M-f> :Autoformat<CR><bar>:w<CR>

" Map for toggling whitespace characters
nnoremap <leader>l :set list!<CR>

" Insert new line without entering insert mode
nnoremap <S-Enter> O<Esc>
nnoremap <CR> o<Esc>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" No need to switch back to English in normal mode
" set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
set langmap =Ч~,ЯQ,ВW,ЕE,РR,ТT,ЪY,УU,ИI,ОO,ПP,Ш{,Щ},АA,СS,ДD,ФF,ГG,ХH,ЙJ,КK,ЛL,ЗZ,ЬZ,ЦC,ЖV,БB,НN,МM,ч`,яq,вw,еe,рr,тt,ъy,уu,иi,оo,пp,ш[,щ],аa,сs,дd,фf,гg,хh,йj,кk,лl,зz,ьz,цc,жv,бb,нn,мm

" Bubble single lines (kicks butt)
" http://vimcasts.org/episodes/bubbling-text/
" Specific escape sequences for wsltty
map <ESC>[A <C-Up>
map <ESC>[B <C-Down>
map! <ESC>[A <C-Up>
map! <ESC>[B <C-Down>

nmap <C-Up> ddkP
nmap <C-Down> ddp

" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Use Ctrl+Tab to switch between last used buffer
nnoremap <C-q> :b#<CR>

" Y yanks from current cursor position to the end
nnoremap Y y$

" Keep cursor position when joining lines with <S-j>
nnoremap J mzJ`z

" Wrapped lines are treated as multiple lines.
nnoremap j gj
nnoremap k gk
" Remap the default behaviour
nnoremap gj j
nnoremap gk k

" Toggle Colorizer
nnoremap <leader>cc :ColorToggle<CR>

" Toggle Argwrap
nnoremap <leader>aa :ArgWrap<CR>

" Navigate through tabs
nnoremap tk :tabprev<CR>
nnoremap tj :tabnext<CR>
nnoremap tn :tabnew<CR>
nnoremap tc :tabclose<CR>
" ---------- End of key mappings ------
