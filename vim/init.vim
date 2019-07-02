call plug#begin()
" Git wrapper
Plug 'tpope/vim-fugitive' " UNUSED / usefull for displaying current branch

" File explorer tree view
Plug 'scrooloose/nerdtree'

" Automatic closing of quotes, paranthesis, brackets, etc.
Plug 'raimondi/delimitmate'

" Statusline enhancements
Plug 'vim-airline/vim-airline'

" Wrap text in tags, braces, etc. or delete the surrounding tags, braces, tec .
Plug 'tpope/vim-surround'

" Highlight yanked text
Plug 'machakann/vim-highlightedyank'

" Commenting
Plug 'tomtom/tcomment_vim'

" Integration with editorconfig
Plug 'editorconfig/editorconfig-vim'

" Concealing for JS
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }

" JS syntax highlighting
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }

" Airline themes
Plug 'vim-airline/vim-airline-themes'

" Code linter/fixer, should work async
Plug 'w0rp/ale'

" Exchange two text elements/blocks easily
Plug 'tommcdo/vim-exchange'

" Search tool wrapper
Plug 'mileszs/ack.vim'

" Insert or delete brackets, automatically add new lines between brackets
Plug 'jiangmiao/auto-pairs'

" Typescript syntax
Plug 'leafgarland/typescript-vim', { 'for': [ 'typescript', 'tsx' ]}

" Press enter to open file in quickfix/loclist
Plug 'yssl/QFEnter'

" Autocompletion using LSPs
" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Use plugin manager for coc-extensions management - https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#use-vims-plugin-manager-for-coc-extension

" Syntax support for JSON
Plug 'elzr/vim-json', { 'for': 'json' }

" Color hex codes and color names
Plug 'chrisbra/Colorizer'

" Place items in braces on new row each
Plug 'FooSoft/vim-argwrap'
"
" TypeScript syntax highlighting
Plug 'HerringtonDarkholme/yats.vim', { 'for': [ 'typescript', 'tsx' ]}

" Vim understands .tmux.conf¬
Plug 'tmux-plugins/vim-tmux'

" Make autoread work in tmux¬
Plug 'tmux-plugins/vim-tmux-focus-events'

" Jump between vim splits and tmux panes with the same key combination - C-k,
" C-j, C-h, C-l
" Needs to be configured in .tmux.conf as well
Plug 'christoomey/vim-tmux-navigator'

" Automatically :set paste! when inserting text from outside vim(e.g.
" shift+insert)
Plug 'ConradIrwin/vim-bracketed-paste'

" Automatically close html tags
Plug 'alvan/vim-closetag'

" Themes
" Plug 'flazz/vim-colorschemes'
" Plug 'rafi/awesome-vim-colorschemes'
" Plug 'tomasiser/vim-code-dark'
Plug 'joshdick/onedark.vim'
" Plug 'rakr/vim-one'
" Plug 'lifepillar/vim-solarized8'
" Plug 'altercation/vim-colors-solarized'

" Display number of search matches & index of current match
Plug 'google/vim-searchindex'

" Needed for proper icons with nerd fonts
Plug 'ryanoasis/vim-devicons'

call plug#end()

" Keep 1000 lines of command line history
set history=1000

" Search is case insensitive
set ignorecase
set smartcase

" Always set autoindenting on
set smartindent
set autoindent
set copyindent

" Needed for coc.nvim update time, may lead to performance issues
set updatetime=300

" Don't give |ins-completion-menu| messages.
set shortmess+=c

"Highlight searches
set hlsearch

" Tell vim to keep a backup file
" Should be $XDG_DATA_HOME/nvim/backup but macos is not happy
if !isdirectory($HOME.'/.config/nvim/backup')
	call mkdir($HOME.'/.config/nvim/backup', 'p')
endif

set backup
" Double trailing back-slash: https://news.ycombinator.com/item?id=1690673
set backupdir=$HOME/.config/nvim/backup//

" persist undos
set undofile

if (has("termguicolors"))
	set termguicolors
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

" Leave hidden buffers open
set hidden

" Do not show the mode (-- INSERT --) at the bottom
set noshowmode

" No error bells
set noerrorbells

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
set clipboard+=unnamedplus

" Always show at least 10 visible lines above/below cursor
set scrolloff=10

" Highlights the current line
set cursorline

" Change the working directory to the currently open file
set autochdir

" Ato-resize splits when VIM is resized(e.g. open new split in tmux)
autocmd VimResized * :wincmd =

" Set path to python3, needed for python based plugins
let g:python3_host_prog = '/usr/local/bin/python3'

let mapleader="\<BS>"

" Enable line numbers for NERDTree
let NERDTreeShowLineNumbers=1

" As per docs
" let g:deoplete#enable_at_startup = 1

" NERDTree file sorting
let g:NERDTreeSortOrder=['\/$', '\.html$', '\.js$', '*',  '\~$']

" Use relative numbers for NERDTree
autocmd FileType nerdtree setlocal relativenumber
" Disable NERDTree expand arrows in favor of devicons
let NERDTreeDirArrowExpandable=' '
let NERDTreeDirArrowCollapsible=' '

" NERDTrees File highlighting
" https://github.com/ryanoasis/vim-devicons/wiki/FAQ-&-Troubleshooting#how-did-you-get-color-matching-based-on-file-type-in-nerdtree
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd FileType NERDTree silent highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd FileType NERDTree silent syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('md', 'blue', 'NONE', '#5ca4ef', 'NONE')
call NERDTreeHighlightFile('yml', 'yellow', 'NONE', '#e25141', 'NONE')
call NERDTreeHighlightFile('json', 'yellow', 'NONE', '#f3c14f', 'NONE')
call NERDTreeHighlightFile('html', 'yellow', 'NONE', '#d45735', 'NONE')
call NERDTreeHighlightFile('css', 'cyan', 'NONE', '#5ca4ef', 'NONE')
call NERDTreeHighlightFile('js', 'Red', 'NONE', '#f7cb4f', 'NONE')
call NERDTreeHighlightFile('ts', 'cyan', 'NONE', 'cyan', 'NONE')
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

" Custom icons for file extensions
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['ts'] = 'ﯤ'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['json'] = 'ﬥ'

let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.test.ts'] = 'ﭧ'

" Custom icons for specific filenames
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['ormconfig.js'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.env'] = 'ﭩ'
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.editorconfig'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.npmrc'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['src'] = ''

let g:DevIconsDefaultFolderOpenSymbol=''
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol=''

" Hide NERDTree folder trailing slashes
" https://github.com/scrooloose/nerdtree/issues/807#issuecomment-366997266
augroup nerdtreehidetirslashes
	autocmd!
	autocmd FileType nerdtree syntax match NERDTreeDirSlash #/$# containedin=NERDTreeDir conceal contained
augroup end


" CtrlP configuration
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

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

" Highlight current line only on active window
" https://superuser.com/a/393948
" More advanced tool - https://github.com/blueyed/vim-diminactive
augroup BgHighlight
	autocmd!
	autocmd WinEnter * set cul
	autocmd WinLeave * set nocul
augroup END

" Change line number column colors
highlight LineNr guifg=LightGrey guibg=DarkGray

" Change color of matching parens. Currently matches highlight color of onedark
" https://stackoverflow.com/a/10746829
hi MatchParen guibg=#e4b870 guifg=#23272e gui=bold cterm=bold ctermbg=14 ctermfg=31

" Do not highlight lines when searching files
" hi QuickFixLine guibg=NONE

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

" Disable keybindings for auto-pairs - https://github.com/jiangmiao/auto-pairs#shortcuts
let g:AutoPairsShortcutToggle = ""

" Fix extra closing '>' when using vim-closetag with delimitMate
let delimitMate_matchpairs ="(:),[:],{:}"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use Ctrl-X + Ctrl-O to trigger completion.
inoremap <silent><expr> <C-x><C-o> coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use K to show documentation in preview window
nnoremap <silent><leader><leader>t :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Navigate between Ale errors
nmap <leader><leader>k <Plug>(ale_previous_wrap)
nmap <leader><leader>j <Plug>(ale_next_wrap)

" Run Ale fixer
nmap <leader><leader>f <Plug>(ale_fix)

" Get type of element under cursor(works only in ts)
" nmap <leader>tt <Plug>(ale_hover)

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

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
" " Use Ctrl-X + Ctrl-O to trigger completion.
" inoremap <silent><expr> <C-x><C-o> coc#refresh()
"
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" noremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" " Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>
" autocmd CursorHold * silent call CocActionAsync('highlight')
"
" call denite#custom#source('grep', 'args', ['', '', '!'])
" call denite#custom#var('grep', 'command', ['ag'])
" call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
" call denite#custom#var('grep', 'recursive_opts', [])
" call denite#custom#var('grep', 'pattern_opt', [])
" call denite#custom#var('grep', 'separator', ['--'])
" call denite#custom#var('grep', 'final_opts', [])
"
" let ignore=&wildignore . ',*.pyc,.git,.hg,.svn,node_modules'
" call denite#custom#var('file/rec', 'command', ['scantree.py', '--ignore', ignore])
"
" autocmd FileType denite-filter inoremap <buffer><expr> <Esc> denite#do_map('quit')
" autocmd FileType denite nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
" autocmd FileType denite nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
" autocmd FileType denite nnoremap <silent><buffer><expr> <Esc> denite#do_map('quit')
" autocmd FileType denite nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
"
" nmap <silent> <C-p> :DeniteProjectDir file/rec -split=floating -highlight-matched-char=WildMenu -start-filter -winrow=5<CR>
" nmap <silent> <C-f> :DeniteProjectDir grep -split=floating -start-filter -auto-action=preview -winrow=5<CR>
" call denite#custom#option('_', 'statusline', v:false)
" For reference:
"
" let s:menus = {}
"
" let s:menus.zsh = {
" 	\ 'description': 'Edit your import zsh configuration'
" 	\ }
" let s:menus.zsh.file_candidates = [
" 	\ ['zshrc', '~/.config/zsh/.zshrc'],
" 	\ ['zshenv', '~/.zshenv'],
" 	\ ]
"
" let s:menus.my_commands = {
" 	\ 'description': 'Example commands'
" 	\ }
" let s:menus.my_commands.command_candidates = [
" 	\ ['Split the window', 'vnew'],
" 	\ ['Open zsh menu', 'Denite menu:zsh'],
" 	\ ['Go back', 'Denite menu'],
" 	\ ['Format code', 'FormatCode', 'go,python'],
" 	\ ]
"
" call denite#custom#var('menu', 'menus', s:menus)
