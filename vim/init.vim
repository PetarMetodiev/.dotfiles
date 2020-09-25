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
Plug 'machakann/vim-highlightedyank' " uses built in TextYankPost, no need to remove it

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

" Set current working dir to the project root
" Useful for ag, rg, etc...
Plug 'airblade/vim-rooter'

" Insert or delete brackets, automatically add new lines between brackets
Plug 'jiangmiao/auto-pairs'

" Typescript syntax
Plug 'leafgarland/typescript-vim', { 'for': [ 'typescript', 'tsx' ]}

" List of LSP Servers: https://langserver.org/
Plug 'autozimu/LanguageClient-neovim', {
			\ 'branch': 'next',
			\ 'do': 'bash install.sh',
			\ }

" Path to locally installed FZF
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Completion engine
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Integrates with LanguageClient-neovim and deoplete
Plug 'Shougo/neosnippet.vim'

" Floating window for deoplete
" Shows docs for an item(if docs exist)
Plug 'ncm2/float-preview.nvim'

" Syntax support for JSON
Plug 'elzr/vim-json', { 'for': 'json' }

" Color hex codes and color names
Plug 'norcalli/nvim-colorizer.lua'

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

" Session save and restore.
" Works great with tmux-resurrect and tmux-continuum
Plug 'tpope/vim-obsession'

" Automatically :set paste! when inserting text from outside vim(e.g.
" shift+insert)
Plug 'ConradIrwin/vim-bracketed-paste'

" Automatically close html tags
Plug 'alvan/vim-closetag'

" Automatically clear search highlight
Plug 'pgdouyon/vim-evanesco'

" Repeat with '.' surroundings
Plug 'tpope/vim-repeat'

" Move between different undo paths in undo history
Plug 'mbbill/undotree'

" Display contents of registers when pressing "(normal) or Ctrl-R(insert)
Plug 'junegunn/vim-peekaboo'

" Themes
" Plug 'flazz/vim-colorschemes'
" Plug 'rafi/awesome-vim-colorschemes'
" Plug 'tomasiser/vim-code-dark'
Plug 'joshdick/onedark.vim'
" Plug 'rakr/vim-one'
" Plug 'lifepillar/vim-solarized8'
" Plug 'altercation/vim-colors-solarized'

" Display number of search matches & index of current match
Plug 'henrik/vim-indexed-search'

" Needed for proper icons with nerd fonts
Plug 'ryanoasis/vim-devicons'

call plug#end()

" Neovim defaults: https://neovim.io/doc/user/vim_diff.html
"
set termguicolors

" Has to be set after setting termguicolors
" More info on configuration :h colorizer.lua
lua require 'colorizer'.setup ({
			\ 'vim',
			\ 'css',
			\ 'html',
			\ 'typescript'
			\ })

" Keep 1000 lines of command line history
set history=1000

" Search is case insensitive
set ignorecase
set smartcase

" Always set autoindenting on
set smartindent
set autoindent
set copyindent
" Should insert same indentation as the rest of the file
set smarttab

" Bracket highlighting while in insert mode. After typing a paren, brace, or bracket, the cursor will automatically jump to the matching bracket
" and return to the insert position.
set showmatch
set matchtime=3

" Needed for coc.nvim update time, may lead to performance issues
set updatetime=300

" Don't give |ins-completion-menu| messages.
set shortmess+=c

"Highlight searches
set hlsearch

" Make floating window and other overlays slightly transparent
set winblend=10 " Floating window
set pumblend=10 " All kinds of popup menus

" Create backup dir if needed
" Should be $XDG_DATA_HOME/nvim/backup but macos is not happy
if !isdirectory($HOME.'/.config/nvim/backup')
	call mkdir($HOME.'/.config/nvim/backup', 'p')
endif

" Create swapfile dir if needed
if !isdirectory($HOME.'/.config/nvim/swap')
	call mkdir($HOME.'/.config/nvim/swap', 'p')
endif

" Create swapfile dir if needed
if !isdirectory($HOME.'/.config/nvim/undo')
	call mkdir($HOME.'/.config/nvim/undo', 'p')
endif

" https://begriffs.com/posts/2019-07-19-history-use-vim.html#backups-and-undo
" Protect changes between writes. Default values of
" Updatecount (200 keystrokes) and updatetime
" (4 seconds) are fine
set swapfile
set directory^=~/.config/nvim/swap//

" Protect against crash-during-write
set writebackup
" ...but do not persist backup after successful write
set nobackup
" Use rename-and-write-new method whenever safe
set backupcopy=auto
" Double trailing back-slash: https://news.ycombinator.com/item?id=1690673
set backupdir=$HOME/.config/nvim/backup//

" persist the undo tree for each file
set undofile
set undodir^=~/.config/nvim/undo//

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
" highlight NonText ctermfg=8 guifg=#4d4d4d " Used for coloring the character for the wrapping lines

" Display relative line numbers
set relativenumber

" Display absolute line numbers
set number

" Show a character for wrapped lines.
set showbreak=\ \ \\ 

" Show wrapped line character inside the number column.
set cpoptions+=n

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

" Set the appearance of whitespace characters
set listchars=tab:»\ ,trail:·

" Turn on whitespace characters by default
set list

" Show as much as possible from last wrapped line
set display+=lastline

" Do not continue comment using o or O
" Why use augroup: https://vi.stackexchange.com/a/1985
augroup all_filetypes
	au!
	au Filetype * set formatoptions-=o
augroup END

" No // when joining commented lines
set formatoptions+=j

" Explanation - https://www.youtube.com/watch?v=sA3z6gsqOuw
set inccommand=split

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

" Hide ~ symbols at the end of a file
set fillchars=eob:\ 

" Do not show completion options in preview window
" Needed for deoplete as  ncm2/float-preview.nvim shows docs in floating
" window
set completeopt-=preview

" Treat dash separated words as a word text object
set iskeyword+=-

augroup background_colors
	au!
	au FocusGained * highlight Normal guibg=#282C34
	au FocusLost * highlight Normal guibg=#141619
augroup END

" Do not show line numbers in quickfix window and in ale preview window
" Close ale preview window with ESC
augroup preview_settings
	au!
	au Filetype qf setlocal nornu nonu
	au Filetype ale-preview-selection setlocal nornu nonu
	au Filetype ale-preview-selection nnoremap <buffer> <ESC> ZZ
augroup END

" Set path to python3, needed for python based plugins
let g:python3_host_prog = '/usr/local/bin/python3'

let g:rooter_patterns = [
			\ '.git',
			\ '.git/',
			\ '_darcs/',
			\ '.hg/',
			\ '.bzr/',
			\ '.svn/',
			\ 'node_modules/']

" May be Ale does the job well enough?
let g:LanguageClient_diagnosticsEnable=0

" Open context menu in fzf
let g:LanguageClient_selectionUI = 'fzf'

" If not explicitly disabled, a check is made for known snippet plugins.
" May lead to performance hits.
let g:LanguageClient_hasSnippetSupport = 0

" Default is 'Auto' and leads to inconsistent behavior.
let g:LanguageClient_hoverPreview = 'Always'

let g:LanguageClient_serverCommands = {
			\ 'javascript': ['typescript-language-server', '--stdio'],
			\ 'typescript': ['typescript-language-server', '--stdio'],
			\ }
			" \ 'javascript': ['javascript-typescript-stdio'],
			" \ 'typescript': ['javascript-typescript-stdio'],
			" \ }

let g:LanguageClient_rootMarkers = {
			\ 'javascript': ['jsconfig.json'],
			\ 'typescript': ['tsconfig.json'],
			\ }

let g:deoplete#enable_at_startup = 1

let g:neosnippet#disable_runtime_snippets = {
			\   '_' : 1,
			\ }
let g:neosnippet#snippets_directory = "~/.config/nvim/custom-snippets"
" if has('conceal')
"	set conceallevel=2 concealcursor=niv
" endif

call deoplete#custom#source('_', 'buffer')

call deoplete#custom#source('_', {
			\ 'max_abbr_width': 0,
			\ 'max_menu_width': 0
			\ })

call deoplete#custom#source('LanguageClient', {
			\ 'max_abbr_width': 0,
			\ 'max_menu_width': 0,
			\ 'min_pattern_length': 2,
			\ 'rank': 500,
			\ 'dup': v:false
			\ })

" Scroll through deoplete items with tab and shift+tab
" This interferes with Tab expansion for snippets and commenting it out seems
" to solve all issues.
" Leaving this for reference in case any problem with completion arises.
" inoremap <silent><expr> <TAB>
"			\ pumvisible() ? "\<C-n>" :
"			\ <SID>check_back_space() ? "\<TAB>" :
"			\ deoplete#manual_complete()
inoremap <silent><expr> <S-TAB>
			\ pumvisible() ? "\<C-p>" :
			\ <SID>check_back_space() ? "\<S-TAB>" :
			\ deoplete#manual_complete()

function! s:check_back_space() abort "{{{
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction "}}}

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_or_jump)

" Turns out <C-k> works well enough
" imap <expr><TAB>
" 			\ pumvisible() ? "\<C-n>" :
" 			\ neosnippet#expandable_or_jumpable() ?
" 			\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" 			\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"


augroup neosnippets
	autocmd!
	autocmd InsertLeave * NeoSnippetClearMarkers
augroup END
snoremap <silent><ESC>  <ESC>:NeoSnippetClearMarkers<CR>
" Set up fzf to work with Ag
command! -bang -nargs=* Ag
			\ call fzf#vim#ag(
			\   '',
			\   fzf#vim#with_preview('right:50%:noborder'))

let mapleader="\<BS>"

" Enable line numbers for NERDTree
let NERDTreeShowLineNumbers=1

" NERDTree file sorting
let g:NERDTreeSortOrder=['\/$', '\.html$', '\.scss$', '\.css$', '\.ts$', '\.tsx$', '\.jsx$', '\.js$', '*',  '\~$']

" Hide Press ? for help
let NERDTreeMinimalUI = 1

" Use relative numbers for NERDTree
augroup NERDTreeSettings
	autocmd!
	autocmd FileType nerdtree setlocal relativenumber
augroup END
" Disable NERDTree expand arrows in favor of devicons
let NERDTreeDirArrowExpandable=' '
let NERDTreeDirArrowCollapsible=' '

" Automatically delete a buffer when deleting or removing file from NERDTree
let NERDTreeAutoDeleteBuffer = 1

" If NERDTree is the only thing left in tab - close tab
augroup CloseLonelyNERDTree
	autocmd!
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

" Based on https://github.com/zeorin/dotfiles/blob/master/.vimrc#L1019
let cog_icon = ""
let md_icon = ""
let json_icon = "ﬥ"
let html_icon = ""
let css_icon = ""
let scss_icon = ""
let js_icon = ""
let ts_icon = "ﯤ"
let test_icon = "ﭧ"
let orm_icon =""
let env_icon = "ﭩ"
let npm_icon = ""
let src_icon = ""
let git_icon = ""
let vim_icon = ""
let gulp_icon = ""
let license_icon = ""
let npm_folder_icon = ""

let g:icons_map = {
			\ 'ts_icon': ts_icon,
			\ 'md_icon': md_icon,
			\ 'json_icon': json_icon,
			\ 'html_icon': html_icon,
			\ 'css_icon': css_icon,
			\ 'scss_icon': scss_icon,
			\ 'js_icon': js_icon,
			\ 'cog_icon': cog_icon,
			\ 'test_icon': test_icon,
			\ 'orm_icon': orm_icon,
			\ 'env_icon': env_icon,
			\ 'git_icon': git_icon,
			\ 'vim_icon': vim_icon,
			\ 'gulp_icon': gulp_icon,
			\ 'license_icon': license_icon,
			\ 'npm_folder_icon': npm_folder_icon,
			\}

augroup devicons_colors
	autocmd!
	let icons = keys(g:icons_map)
	for icon in g:icons
		exec 'autocmd FileType nerdtree syntax match '.icon.'_color /\v'.g:icons_map[icon].'/ containedin=ALL'
	endfor
augroup END

highlight ts_icon_color guifg=Cyan
highlight md_icon_color guifg=#5ca4ef
highlight yml_icon_color guifg=#e25141
highlight json_icon_color guifg=#f3c14f
highlight html_icon_color guifg=#d45735
highlight css_icon_color guifg=#5ca4ef
highlight scss_icon_color guifg=#ce6499
highlight js_icon_color guifg=#f7cb4f
highlight cog_icon_color guifg=#fdfdfd
highlight test_icon_color guifg=Red
highlight orm_icon_color guifg=#fdfdfd
highlight env_icon_color guifg=#fdfdfd
highlight git_icon_color guifg=#6cc644
highlight vim_icon_color guifg=#8FAA54
highlight gulp_icon_color guifg=#DB4446
highlight license_icon_color guifg=#fdfdfd
highlight npm_folder_icon_color guifg=#ad403f

" Make node_modules grey(similar to VSCode). Not sure how to make grey the
" contents of node_modules
augroup node_modules_colors
	autocmd!
	autocmd FileType nerdtree syntax match node_modules_dir "\vnode_modules" containedin=ALL
augroup END

highlight node_modules_dir guifg=#5c6370

" Fix for not loading files sometimes - https://github.com/scrooloose/nerdtree/issues/587
let NERDTreeIgnore=['\c^ntuser\..*', '\.git$']

" Show hidden files
let NERDTreeShowHidden=1

" Show folder icons in NERDTree
" A little buggy, test if it is useful
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1

let g:DevIconsDefaultFolderOpenSymbol=''
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol=''

let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1

" Custom icons for file extensions
" Next line is needed needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = js_icon
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['ts'] = ts_icon
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['json'] = json_icon

" Next line is needed needed
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.test.ts'] = test_icon
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['license'] = license_icon

" Custom icons for specific filenames
" Next line is needed needed
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['ormconfig.js'] = orm_icon
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.env'] = env_icon
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.editorconfig'] = cog_icon
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.npmrc'] = npm_icon
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.gitignore'] = git_icon
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['src'] = src_icon
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['node_modules'] = npm_folder_icon

" Hide NERDTree folder trailing slashes
" https://github.com/scrooloose/nerdtree/issues/807#issuecomment-366997266
augroup nerdtreehidetirslashes
	autocmd!
	autocmd FileType nerdtree syntax match NERDTreeDirSlash #/$# containedin=NERDTreeDir conceal contained
augroup end

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

let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = ' '

highlight ALEVirtualTextError guifg=#56688a gui=NONE,italic

let g:ale_completion_autoimport = 1

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

" https://github.com/junegunn/fzf/blob/master/README-VIM.md#hide-statusline
augroup fzf_options
	autocmd! FileType fzf
	autocmd  FileType fzf set nonu nornu
				\| autocmd BufLeave <buffer> set nu rnu
augroup END

let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-s': 'split',
			\ 'ctrl-v': 'vsplit' }


" fzf colors:
"   fg	       Text
"   bg	       Background
"   preview-fg Preview window text
"   preview-bg Preview window background
"   hl	       Highlighted substrings
"   fg+        Text (current line)
"   bg+        Background (current line)
"   gutter     Gutter on the left (defaults to bg+)
"   hl+        Highlighted substrings (current line)
"   info       Info
"   border     Border of the preview window and horizontal separators (--border)
"   prompt     Prompt
"   pointer    Pointer to the current line
"   marker     Multi-select marker
"   spinner    Streaming input indicator
"   header     Header

hi link FzfPlus LineNr

let g:fzf_colors =
			\ { 'fg':      ['fg', 'Normal'],
			\ 'bg':      ['bg', 'CursorColumn'],
			\ 'hl':      ['fg', 'Comment'],
			\ 'fg+':     ['fg', 'FzfPlus'],
			\ 'bg+':     ['bg', 'FzfPlus'],
			\ 'gutter':  ['bg', 'CursorColumn'],
			\ 'hl+':     ['fg', 'Statement'],
			\ 'prompt':  ['fg', 'Conditional'],
			\ 'pointer': ['fg', 'Exception'],
			\ 'marker':  ['fg', 'Keyword'],
			\ 'spinner': ['fg', 'Label'],
			\ 'header':  ['fg', 'Comment'] }

if has('nvim')
	let $FZF_DEFAULT_OPTS .= ' --border --margin=1,1'

	function! FloatingFZF()
		let width = float2nr(&columns * 0.8)
		let height = 20
		let opts = { 'relative': 'editor',
					\ 'row': &lines - height - 5,
					\ 'col': (&columns - width) / 2,
					\ 'width': width,
					\ 'height': height }

		let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
		call setwinvar(win, '&winhighlight', 'NormalFloat:Normal')
	endfunction

	let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif

" Remember last position when reopening a file
augroup ResumeCursor
	autocmd!
	autocmd BufReadPost *  if line("'\"") > 1 && line("'\"") <= line("$")
				\|     exe "normal! g`\""
				\|  endif
augroup END

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

" Change line number column colors
highlight LineNr guifg=LightGrey guibg=#808080

" Change color of matching parens. Currently matches highlight color of onedark
" https://stackoverflow.com/a/10746829
hi MatchParen guibg=#ee88ee guifg=#23272e gui=bold cterm=bold ctermbg=14 ctermfg=31

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

" By default, it will display something like 'utf-8[unix]', however, you can
" skip displaying it, if the output matches a configured string. To do so, set >
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

" Short mode names for airline(show I instead of INSERT)
let g:airline_mode_map = {
			\ '__'	   : '-',
			\ 'c'	   : 'C',
			\ 'i'	   : 'I',
			\ 'ic'	   : 'I',
			\ 'ix'	   : 'I',
			\ 'n'	   : 'N',
			\ 'multi'  : 'M',
			\ 'ni'	   : 'N',
			\ 'no'	   : 'N',
			\ 'R'	   : 'R',
			\ 'Rv'	   : 'R',
			\ 's'	   : 'S',
			\ 'S'	   : 'S',
			\ ''	   : 'S',
			\ 't'	   : 'T',
			\ 'v'	   : 'V',
			\ 'V'	   : 'V',
			\ ''	   : 'V',
			\ }

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

" Set duration of highlighting when yanking
let g:highlightedyank_highlight_duration = 300

" Disable folding
set nofoldenable

" Disable keybindings for auto-pairs - https://github.com/jiangmiao/auto-pairs#shortcuts
let g:AutoPairsShortcutToggle = ""

" Jump between matching < and > with %
set matchpairs+=<:>

" Fix extra closing '>' when using vim-closetag with delimitMate
augroup html_delimitmate
	au!
	au FileType html let b:delimitMate_matchpairs = "(:),[:],{:}"
augroup END
let delimitMate_matchpairs = "(:),[:],{:},<:>"

" +------------------------+----------+
" |                        |          |
" |                        |          |
" |                        | undotree |
" |                        |          |
" |                        |          |
" +------------------------+----------+
" |                                   |
" |                            diff   |
" |                                   |
" +-----------------------------------+
let g:undotree_WindowLayout = 4
" Autofocus on undotree when it is opened
let g:undotree_SetFocusWhenToggle = 1
" Use (6 s) instead of (6 seconds ago)
let g:undotree_ShortIndicators = 1

nnoremap <silent> <leader>u :UndotreeToggle<CR>

function g:Undotree_CustomMap()
	nmap <buffer> <Esc> <plug>UndotreeClose
endfunc

" https://github.com/pgdouyon/vim-evanesco/issues/6#issuecomment-251026521
let g:indexed_search_mappings = 0
nmap <silent> / :ShowSearchIndex<CR><Plug>Evanesco_/
nmap <silent> ? :ShowSearchIndex<CR><Plug>Evanesco_?
nmap <silent> n <Plug>Evanesco_n:ShowSearchIndex<CR>
nmap <silent> N <Plug>Evanesco_N:ShowSearchIndex<CR>
nmap <silent> * <Plug>Evanesco_*:ShowSearchIndex<CR>
nmap <silent> # <Plug>Evanesco_#:ShowSearchIndex<CR>

" Navigate between Ale errors
nmap <silent> gk <Plug>(ale_previous_wrap)
nmap <silent> gj <Plug>(ale_next_wrap)

" Run Ale fixer
nmap <silent> gf <Plug>(ale_fix)

" Get type of element under cursor(works only in ts)
nmap <silent> K :<C-U>call LanguageClient_textDocument_hover()<CR>

" Call :ContextMenu to open LanguageClient context menu
nmap <silent> gt :<C-U>call LanguageClient_contextMenu()<CR>

" Vim hard mode.
nnoremap <silent> <Left> :<C-U>echoe "Use h"<CR>
nnoremap <silent> <Right> :<C-U>echoe "Use l"<CR>
nnoremap <Up> :<C-U><Up>
nnoremap <silent> <Down> :<C-U>echoe "Use j"<CR>

" Open vimrc
nnoremap <silent> <leader>e :<C-U>e $MYVIMRC<CR>

" Equalize splits
nnoremap <silent>- :<C-U>wincmd =<cr>

" Maximize window
nnoremap <silent>_ :<C-U>wincmd _<cr>

" Hopefuly will help with colorscheme stops working.
nnoremap <silent>U :<C-U>syntax sync fromstart<cr>:redraw!<cr>

" Insert empty space in normal mode
nnoremap <space> :
vnoremap <space> :

" Going to the first character of the line is ofter times more needed
" 0 is easier to press than Shift+6
nnoremap ^ 0
nnoremap 0 ^
vnoremap ^ 0
vnoremap 0 ^

" Map Ctrl+b to open NERDTree. To close press <q>
nnoremap <silent><expr> <C-b> g:NERDTree.IsOpen() ? ":NERDTreeClose\<CR>" : ":NERDTreeFind\<CR>zz"

" Insert new line without entering insert mode
nnoremap <CR> o<Esc>
" Needs Option key to ack as +Esc in iTerm2 - https://coderwall.com/p/h6yfda/use-and-to-jump-forwards-backwards-words-in-iterm-2-on-os-x
nnoremap <M-CR> O<Esc>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" No need to switch back to English in normal mode
" set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
set langmap =Ч~,ЯQ,ВW,ЕE,РR,ТT,ЪY,УU,ИI,ОO,ПP,Ш{,Щ},АA,СS,ДD,ФF,ГG,ХH,ЙJ,КK,ЛL,ЗZ,ЬZ,ЦC,ЖV,БB,НN,МM,ч`,яq,вw,еe,рr,тt,ъy,уu,иi,оo,пp,ш[,щ],аa,сs,дd,фf,гg,хh,йj,кk,лl,зz,ьz,цc,жv,бb,нn,мm

" Use Ctrl+q to switch between last used buffer(Ctrl+TAB is not reliable in
" all terminals)
nnoremap <silent> <C-q> :<C-U>b#<CR>

" Y yanks from current cursor position to the end
nnoremap Y y$

" Keep cursor position when joining lines with <S-j>
nnoremap J mzJ`z

" Wrapped lines are treated as multiple lines.
nnoremap j gj
nnoremap k gk
" Remap the default behaviour
nnoremap <leader>j j
nnoremap <leader>k k

" Toggle Colorizer
nnoremap <silent> <leader>cc :<C-U>ColorizerToggle<CR>

" Toggle Argwrap
nnoremap <silent> <leader>aa :<C-U>ArgWrap<CR>

" Clean line contents without delteing the line
nnoremap <leader>x 0"_D

" Navigate through tabs
nnoremap <silent>tk :<C-U>tabprev<CR>
nnoremap <silent>tj :<C-U>tabnext<CR>
nnoremap <silent>tn :<C-U>tabnew<CR>

nnoremap <silent> <C-P> :<C-U>GFiles<CR>
nnoremap <silent> <C-f> :<C-U>Buffers<CR>

if exists("g:loaded_webdevicons")
	call webdevicons#refresh()
endif
