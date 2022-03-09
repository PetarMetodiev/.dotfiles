local utils = require('user/utils')

-- Make NeoVim support 24bit colors (pretty terminal 🤩)
opt.termguicolors = true

-- Keep 1000 lines of command line history
opt.history = 1000

-- Search is case insensitive
opt.ignorecase = true

-- Search is not case sensitive when the search term contains a capital letter
opt.smartcase = true

-- Size of an indentation
opt.shiftwidth = 2
-- Try to guess indentation based on syntax
opt.smartindent = true
-- Copy the structure of the existing lines indent when autoindenting a new line
opt.copyindent = true
-- Should insert same indentation as the rest of the file
opt.smarttab = true
-- Explanation https://vimtricks.com/p/ensuring-aligned-indentation/
opt.shiftround = true

-- Bracket highlighting while in insert mode. After typing a paren, brace, or bracket, the cursor will automatically jump to the matching bracket
-- and return to the insert position.
opt.showmatch = true
opt.matchtime = 3

-- Faster completion
opt.updatetime = 300

-- Don't give |ins-completion-menu| messages.
opt.shortmess:append('c')

-- Highlight searches
opt.hlsearch = true

-- Make floating window and other overlays slightly transparent
-- opt.winblend = 10 -- Floating window
-- opt.pumblend = 10 -- All kinds of popup menus

-- Display relative line numbers
opt.relativenumber = true

-- Display absolute line numbers
opt.number = true

-- Show a character for wrapped lines.
opt.showbreak = '    '

-- Show wrapped line character inside the number column.
opt.cpoptions:append('n')

-- Leave hidden buffers open
opt.hidden = true

-- Do not show the mode (-- INSERT --) at the bottom
opt.showmode = false

-- No error bells
opt.errorbells = false

-- Make search/replace global by default
opt.gdefault = true

-- Open new horizontal split to the bottom
opt.splitbelow = true

-- Open new vertical split to the right
opt.splitright = true

-- Set the appearance of whitespace characters
opt.listchars = 'tab:» ,trail:·'

-- Turn on whitespace characters by default
opt.list = true

-- Show as much as possible from last wrapped line
opt.display:append('lastline')

-- No // when joining commented lines
opt.formatoptions:append('j')

-- Explanation - https://www.youtube.com/watch?v=sA3z6gsqOuw
opt.inccommand = 'split'

-- Mouse support(clicking, scrolling, selecting panes)
opt.mouse = 'a'

-- Share clipboard with system
opt.clipboard:append('unnamedplus')

-- Always show at least 10 visible lines above/below cursor
opt.scrolloff = 10

-- Highlights the current line
opt.cursorline = true

-- Change the working directory to the currently open file
opt.autochdir = false

-- Hide ~ symbols at the end of a file
opt.fillchars = 'eob: '

-- Treat dash separated words as a word text object
opt.iskeyword:append('-')

-- Always show tabs. May be overriden by a tabline plugin
opt.showtabline = 2

-- Disable folding
opt.foldenable = false

-- Create backup dir if needed
utils.safe_create_nvim_dir('backup')
-- Double trailing back-slash: https://news.ycombinator.com/item?id=1690673
opt.backupdir = fn.stdpath('config') .. '/backup//'

-- Create swapfile dir if needed
utils.safe_create_nvim_dir('swap')
opt.directory = fn.stdpath('config') .. '/swap//'

-- Create swapfile dir if needed
utils.safe_create_nvim_dir('undo')
opt.undofile = true
opt.undodir = fn.stdpath('config') .. '/undo//'

-- Prevent signcolumn jumping when git signs or diagnostics show
opt.signcolumn = 'yes:1'

-- pumheight = 10, -- pop up menu height
-- timeoutlen = 100, -- time to wait for a mapped sequence to complete (in milliseconds)
