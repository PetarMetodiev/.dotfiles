-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- The way to tell LazyVim to not autoformat my code
vim.g.autoformat = true

local opt = vim.opt

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

-- Highlight searches
opt.hlsearch = true

-- Display relative line numbers
opt.relativenumber = true

-- Display absolute line numbers
opt.number = true

opt.wrap = true
-- Show a character for wrapped lines.
opt.showbreak = "   󱞩  "

-- Show wrapped line character inside the number column.
opt.cpoptions:append("n")

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
-- opt.listchars = "tab:» ,trail:·"
opt.listchars.tab = "»"
opt.listchars.trail = "·"

-- Turn on whitespace characters by default
opt.list = true

-- Show as much as possible from last wrapped line
opt.display:append("lastline")

-- No // when joining commented lines
opt.formatoptions:append("j")

-- Explanation - https://www.youtube.com/watch?v=sA3z6gsqOuw
opt.inccommand = "split"

-- Mouse support(clicking, scrolling, selecting panes)
opt.mouse = "a"

-- Share clipboard with system
opt.clipboard:append("unnamedplus")

-- Always show at least 10 visible lines above/below cursor
opt.scrolloff = 10

-- Highlights the current line
opt.cursorline = true

-- Change the working directory to the currently open file
opt.autochdir = false

-- Hide ~ symbols at the end of a file
opt.fillchars.eob = " "

-- Treat dash separated words as a word text object
-- opt.iskeyword:append("-")

-- Always show tabs. May be overriden by a tabline plugin
opt.showtabline = 2

-- Disable folding
opt.foldenable = false

-- Prevent signcolumn jumping when git signs or diagnostics show
opt.signcolumn = "yes:1"
