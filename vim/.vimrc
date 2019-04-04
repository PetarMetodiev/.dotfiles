" Set encoding first in order to avoid any character mismatches further on
set encoding=utf-8

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

" Commenting
Plugin 'tomtom/tcomment_vim'

" Integration with editorconfig
Plugin 'editorconfig/editorconfig-vim'

" Vim autoformating, uses external formatters
" Plugin 'Chiel92/vim-autoformat'

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

" Code linter/fixer, should work async
Plugin 'w0rp/ale'

" Exchange two text elements/blocks easily
Plugin 'tommcdo/vim-exchange'

" Search tool wrapper
Plugin 'mileszs/ack.vim'

" Insert or delete brackets, automatically add new lines between brackets
Plugin 'jiangmiao/auto-pairs'

" Typescript syntax
Plugin 'leafgarland/typescript-vim'

" Typescript IDE likeness
Plugin 'Quramy/tsuquyomi'

" Press enter to open file in quickfix/loclist
Plugin 'yssl/QFEnter'

" Omnicompletion with official support for windows
Plugin 'Shougo/neocomplete.vim'

" The vim source for neocomplete
Plugin 'Shougo/neco-vim'

" Syntax support for JSON
Plugin 'elzr/vim-json'

" Syntax for different javascript libraries
" Plugin 'othree/javascript-libraries-syntax.vim'

" Color hex codes and color names
Plugin 'chrisbra/Colorizer'

" Place items in braces on new row each
Plugin 'FooSoft/vim-argwrap'
"
" TypeScript syntax highlighting
Plugin 'HerringtonDarkholme/yats.vim'

" Vim understands .tmux.conf¬
Plugin 'tmux-plugins/vim-tmux'

" Make autoread work in tmux¬
Plugin 'tmux-plugins/vim-tmux-focus-events'

" Jump between vim splits and tmux panes with the same key combination - C-k,
" C-j, C-h, C-l
" Needs to be configured in .tmux.conf as well
Plugin 'christoomey/vim-tmux-navigator'

" Needed for proper icons with nerd fonts
Plugin 'ryanoasis/vim-devicons'

" Automatically :set paste! when inserting text from outside vim(e.g.
" shift+insert)
Plugin 'ConradIrwin/vim-bracketed-paste'

" Automatically close html tags
Plugin 'alvan/vim-closetag'

" Themes
" Plugin 'flazz/vim-colorschemes'
" Plugin 'rafi/awesome-vim-colorschemes'
" Plugin 'tomasiser/vim-code-dark'
Plugin 'joshdick/onedark.vim'
" Plugin 'rakr/vim-one'
" Plugin 'lifepillar/vim-solarized8'
" Plugin 'altercation/vim-colors-solarized'

" Display number of search matches & index of current match
Plugin 'google/vim-searchindex'

" All of your Plugins must be added before the following line
" required
call vundle#end()

" required
filetype plugin indent on

" ---------- End of Vundle specific settings ----------

" ---------- UI and UX settings ----------

runtime macros/matchit.vim

" Allow backspasing over everything in insert mode
set backspace=indent,eol,start

" Reduce cmd messages clutter.
" f: use '(3 of 5)' instead of '(file 3 of 5)'
" l: use '999L, 888C' instead of '999 lines, 888 characters'
" m: '[+]' instead of '[Modified]'
" n: use '[New]' instead of '[New File]'
" x: use '[dos]' instead of '[dos format]', '[unix]' instead of
"         [unix format]" and '[mac]' instead of '[mac format]'.
set shortmess=flmnx

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

" Look into this - https://stackoverflow.com/a/12488082
" Tell vim where to put its backup files
set backupdir=~/.vim/backup/

" Tell vim where to put swap files
set dir=~/.vim/backup/

" persist undos
set undofile
set undodir=~/.vim/undo/

" https://medium.com/@dubistkomisch/how-to-actually-get-italics-and-true-colour-to-work-in-iterm-tmux-vim-9ebe55ebc2be
if (has("termguicolors"))
	let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
else
	set t_Co=256
endif

" Use italics for onedark colorscheme
" Works only when true colors are set
" Has to be set before setting colorscheme onedark - https://github.com/joshdick/onedark.vim#options
let g:onedark_terminal_italics=1

set background=dark
colorscheme onedark
" colorscheme solarized8_flat
" colorscheme one
" colorscheme codedark
" colorscheme distinguished
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

" Status line is always shown
set laststatus=2

" Do not show the mode (-- INSERT --) at the bottom
set noshowmode

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

" Always show at least 10 visible lines above/below cursor
set scrolloff=10

" Show a list of suggestions above command line when pressing <tab>
set wildmenu

" If a file is changed outside of Vim, it is automatically read again
set autoread

" Highlights the current line
set cursorline

" Change the working directory to the currently open file
set autochdir

" Ato-resize splits when VIM is resized(e.g. open new split in tmux)
autocmd VimResized * :wincmd =

let mapleader="\<BS>"

" Enable line numbers for NERDTree
let NERDTreeShowLineNumbers=1

" NERDTree file sorting
let g:NERDTreeSortOrder=['\/$', '\.html$', '\.js$', '*',  '\~$']

" Use relative numbers for NERDTree
autocmd FileType nerdtree setlocal relativenumber

" Show NERDTree bookmarks by default
let g:NERDTreeShowBookmarks=1

" NERDTrees File highlighting
" https://github.com/ryanoasis/vim-devicons/wiki/FAQ-&-Troubleshooting#how-did-you-get-color-matching-based-on-file-type-in-nerdtree
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('md', 'blue', 'NONE', '#5ca4ef', 'NONE')
call NERDTreeHighlightFile('yml', 'yellow', 'NONE', '#e25141', 'NONE')
call NERDTreeHighlightFile('json', 'yellow', 'NONE', '#f3c14f', 'NONE')
call NERDTreeHighlightFile('html', 'yellow', 'NONE', '#d45735', 'NONE')
call NERDTreeHighlightFile('css', 'cyan', 'NONE', '#5ca4ef', 'NONE')
call NERDTreeHighlightFile('js', 'Red', 'NONE', '#f7cb4f', 'NONE')
call NERDTreeHighlightFile('ts', 'cyan', 'NONE', 'cyan', 'NONE')
call NERDTreeHighlightFile('test.ts', 'cyan', 'NONE', '#e25c33', 'NONE')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'NONE', '#686868', 'NONE')
call NERDTreeHighlightFile('gitignore', 'Gray', 'NONE', '#686868', 'NONE')
call NERDTreeHighlightFile('editorconfig', 'Gray', 'NONE', '#fdfdfd', 'NONE')

" Fix for not loading files sometimes - https://github.com/scrooloose/nerdtree/issues/587
let NERDTreeIgnore=['\c^ntuser\..*']

" Show hidden files
let NERDTreeShowHidden=1

" Show folder icons in NERDTree
" A little buggy, test if it is useful
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['ts'] = 'ﯤ'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['json'] = 'ﬥ'

" CtrlP configuration
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" For .ts files use only tslint, as eslint could be installed sometimes but
" not-configured properly
let g:ale_linters = {
			\   'typescript': ['tslint', 'tsserver'],
			\}
let g:ale_fixers = {
			\ 'javascript': ['prettier'],
			\ 'typescript': ['prettier'],
			\ 'html': ['prettier'],
			\ 'css': ['prettier'],
			\ 'scss': ['prettier'],
			\ 'json': ['prettier'],
			\ 'markdown': ['prettier']
			\}

" Fancy error icons
let g:ale_sign_error = '🚨'
let g:ale_sign_warning = '👀'

let g:ale_echo_msg_error_str = '🚨'
let g:ale_echo_msg_warning_str = '👀'
let g:ale_echo_msg_format = '%severity%%linter%%(code)%: %s'

" These two go together as suggested in the docs
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1

if filereadable(globpath($HOME, '.config/prettier/.prettierrc'))
	let g:ale_javascript_prettier_options = '--config ~/.config/prettier/.prettierrc --config-precedence prefer-file'
	let g:ale_typescript_prettier_options = '--config ~/.config/prettier/.prettierrc --config-precedence prefer-file'
else
	let g:ale_javascript_prettier_options = '--tab-width 4 --single-quote --trailing-comma es5'
	let g:ale_typescript_prettier_options = '--tab-width 4 --single-quote --trailing-comma es5'
endif

let g:ale_css_prettier_options = '--tab-width 4 --single-quote --trailing-comma es5'
let g:ale_scss_prettier_options = '--tab-width 4 --single-quote --trailing-comma es5'
let g:ale_html_prettier_options = '--tab-width 4'
let g:ale_json_prettier_options = '--tab-width 2'

" Remember last position when reopening a file
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Change cursor based on mode
" https://stackoverflow.com/a/30199177
if $TERM_PROGRAM=="iTerm.app"
	if exists('$TMUX')
		let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
		let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
	else
		let &t_SI = "\<Esc>]50;CursorShape=1\x7"
		let &t_EI = "\<Esc>]50;CursorShape=0\x7"
	endif
endif

" No lag between toggling modes
" https://www.johnhawthorn.com/2012/09/vi-escape-delays/
set timeoutlen=1000 ttimeoutlen=0

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
" https://github.com/spf13/spf13-vim/blob/1ce5f23997f6dd82235c6936c5c47b3f1d1b4e50/.vimrc#L135
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" Highlight current line only on active window
" https://superuser.com/a/393948
" More advanced tool - https://github.com/blueyed/vim-diminactive
augroup BgHighlight
	autocmd!
	autocmd WinEnter * set cul
	autocmd WinLeave * set nocul
augroup END

" Automatically reload vimrc on save
augroup ReloadVimrcGroup
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END
" Vim color table
" https://jonasjacek.github.io/colors/

" Change autocomplete dropdown colors
" https://github.com/spf13/spf13-vim/blob/1ce5f23997f6dd82235c6936c5c47b3f1d1b4e50/.vimrc#L533-L535
" https://vi.stackexchange.com/questions/12664/is-there-any-way-to-change-the-popup-menu-color
" hi Pmenu  guifg=grey guibg=lightgrey ctermfg=grey ctermbg=lightgrey
" hi PmenuSbar  guifg=grey93 guibg=#000000 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
" hi PmenuSel  guifg=#808080 guibg=#c0c0c0 gui=standout ctermfg=darkgrey ctermbg=lightgray cterm=standout
" hi PmenuThumb  guifg=#c0c0c0 guibg=#d7ffff gui=NONE ctermfg=lightgray ctermbg=lightcyan cterm=NONE

" Change line number column colors
highlight LineNr ctermfg=grey guifg=grey ctermbg=8 guibg=#808080

" Change color of matching parens. Currently matches highlight color of onedark
" https://stackoverflow.com/a/10746829
hi MatchParen guibg=#e4b870 guifg=#23272e gui=bold cterm=bold ctermbg=14 ctermfg=31

" Do not highlight lines when searching files
hi QuickFixLine guibg=NONE

" Highlight matching parens only in normal mode
" https://www.reddit.com/r/vim/comments/2rz74u/question_because_of_matching_parenthesis/cnnhtcy/
augroup insertMatch
    au!
    au InsertEnter * NoMatchParen
    au InsertLeave * DoMatchParen
augroup END

" No error in airline for white spaces - something anyway useless and takes too much space
let g:airline_section_warning = 0

" Display open buffers in airline
let g:airline#extensions#tabline#enabled = 1

" Use Airline special symbols
let g:airline_powerline_fonts=1

" Airline theme
let g:airline_theme='papercolor'

" Show shortened filename path in vim-airline -> \d\c\d\t\f\file.js
let g:airline#extensions#tabline#fnamemod = ':t'

" Show tab numbers in tabline instead of number of open splits in that tab.
let g:airline#extensions#tabline#tab_nr_type = 1

" Do not close button in the tabline. Needless and not working as expected
let g:airline#extensions#tabline#show_close_button = 0

" Do not draw separators for empty sections (only for the active window)
let g:airline_skip_empty_sections = 1

" If no git repo - show some nice icons
let g:airline#extensions#branch#empty_message = "\uf05e \uf09b"

" ALE integration with airline
let g:airline#extensions#ale#enabled = 1

" CtrlP style bindings for QFEnter
let g:qfenter_keymap = {}
let g:qfenter_keymap.open = ['<CR>', '<2-LeftMouse>']
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>']"

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
" let g:tsuquyomi_use_dev_node_module = 0
" let g:tsuquyomi_use_local_typescript = 0
" Import shortest path instead of complete one, usefull for es6 imports with bundlers
let g:tsuquyomi_shortest_import_path = 1
" Show method signature - may be slow
let g:tsuquyomi_completion_detail = 1
" Show additional information about symbol below the cursor
" https://github.com/Quramy/tsuquyomi/blob/master/doc/tsuquyomi.txt#L467
" autocmd FileType typescript nmap <buffer> <leader>tt :\<C-u><Plug>(ale_hover)<CR>

" typescript-vim configuration
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd FileType typescript :set makeprg=tsc

" Tsuquyomi integration with syntastic
let g:tsuquyomi_disable_quickfix = 1

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
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" https://github.com/Quramy/tsuquyomi/issues/271#issuecomment-467929317
let g:SuperTabClosePreviewOnPopupClose = 1

" Enable omni completion.
if !exists('g:neocomplete#force_omni_input_patterns')
	let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
if !exists('g:neocomplete#sources#omni#functions')
	let g:neocomplete#sources#omni#functions = {}
endif

" Trigger configuration. Do not use <tab> if you use YouCompleteMe
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Disable keybindings for auto-pairs - https://github.com/jiangmiao/auto-pairs#shortcuts
let g:AutoPairsShortcutToggle = ""

" Fix extra closing '>' when using vim-closetag with delimitMate
let delimitMate_matchpairs ="(:),[:],{:}"

" ---------- End of UI and UX settings --------

" ---------- Key mappings ----------

" Navigate between Ale errors
nmap <leader><leader>k <Plug>(ale_previous_wrap)
nmap <leader><leader>j <Plug>(ale_next_wrap)

" Run Ale fixer
nmap <leader><leader>f <Plug>(ale_fix)

" Get type of element under cursor(works only in ts)
nmap <leader>tt <Plug>(ale_hover)

" Vim hard mode.
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Open vimrc
nnoremap <leader>e :e $MYVIMRC<CR>

" Insert empty space in normal mode
nnoremap <space> :

" Map Ctrl+b to open NERDTree. To close press <q>
map <C-b> :NERDTreeToggle<CR>

" Insert new line without entering insert mode
nnoremap <CR> o<Esc>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" No need to switch back to English in normal mode
" set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
set langmap =Ч~,ЯQ,ВW,ЕE,РR,ТT,ЪY,УU,ИI,ОO,ПP,Ш{,Щ},АA,СS,ДD,ФF,ГG,ХH,ЙJ,КK,ЛL,ЗZ,ЬZ,ЦC,ЖV,БB,НN,МM,ч`,яq,вw,еe,рr,тt,ъy,уu,иi,оo,пp,ш[,щ],аa,сs,дd,фf,гg,хh,йj,кk,лl,зz,ьz,цc,жv,бb,нn,мm

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

" Clean line contents without delteing the line
nnoremap <leader>x 0D

" Zoom split(similar to tmux zooming to pane)
nnoremap <leader>z :wincmd _<CR>:wincmd \|<CR>
nnoremap <leader>zz :wincmd =<CR>

" Resize to content
" https://til.hashrocket.com/posts/mvekrlaycp-resize-vim-window-to-the-size-of-its-content
" nnoremap <leader>f :execute('resize ' . line('$'))<CR>

" Navigate through tabs
nnoremap tk :tabprev<CR>
nnoremap tj :tabnext<CR>
nnoremap tn :tabnew<CR>
nnoremap tc :tabclose<CR>
" ---------- End of key mappings ------
