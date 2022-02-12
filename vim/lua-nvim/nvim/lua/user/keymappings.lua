require('user/utils')

-- g.mapleader = '\b'
cmd([[let mapleader="\<BS>"]]) -- no idea how to map leader to Backspace in pure lua

-- Vim hardmode
nnoremap('<Left>', '<cmd>echoe "Use h"<CR>')
nnoremap('<Right>', '<cmd>echoe "Use l"<CR>')
nnoremap('<Down>', '<cmd>echoe "Use j"<CR>')
-- nnoremap is silent by default and does not play well with the binding for Up arrow
vim.api.nvim_set_keymap('n', '<Up>', ':<C-U><Up>', { noremap = true })

-- Open init.lua
nnoremap('<Leader>e', '<cmd>e $MYVIMRC<CR>')

-- Hopefuly will help with colorscheme stops working.
nnoremap('U', '<cmd>syntax sync fromstart<CR>:redraw!<CR>')

-- Insert empty space in normal mode
setmap('n', '<space>', ':', { noremap = true })
setmap('v', '<space>', ':', { noremap = true })

-- Going to the first character of the line is ofter times more needed
-- 0 is easier to press than Shift+6
nnoremap('^', '0')
nnoremap('0', '^')
vnoremap('^', '0')
vnoremap('0', '^')

-- Insert new line without entering insert mode
nnoremap('<CR>', 'o<Esc>')

-- Reselect visual block after indent/outdent
vnoremap('<', '<gv')
vnoremap('>', '>gv')

-- Use Ctrl+q to switch between last used buffer(Ctrl+TAB is not reliable in
-- all terminals)
nnoremap('<C-q>', '<cmd>b#<CR>')

-- Y yanks from current cursor position to the end
nnoremap('Y', 'y$')

-- Keep cursor position when joining lines with <S-j>
nnoremap('J', 'mzJ`z')

-- Wrapped lines are treated as multiple lines.
-- explanation https://youtu.be/hSHATqh8svM?t=319
vim.api.nvim_set_keymap('n', 'k', [[v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk']], { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', [[v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj']], { noremap = true, expr = true, silent = true })

-- Remap the default behaviour
nnoremap('<leader>j', 'j')
nnoremap('<leader>k', 'k')

-- Do not copy stuff when using c/C
nnoremap('c', '"_c')
nnoremap('C', '"_C')
vnoremap('c', '"_c')
vnoremap('C', '"_C')

-- Break undo chain when hitting these
-- explanation https://youtu.be/hSHATqh8svM?t=227
inoremap(',', ',<C-g>u')
inoremap('.', '.<C-g>u')
inoremap('(', '(<C-g>u')
inoremap(')', ')<C-g>u')
inoremap('{', '{<C-g>u')
inoremap('}', '}<C-g>u')
inoremap('+', '+<C-g>u')
inoremap('-', '-<C-g>u')
inoremap('*', '*<C-g>u')
inoremap('\\', '\\<C-g>u')
inoremap('?', '?<C-g>u')
inoremap('!', '!<C-g>u')

-- Clean line contents without delteing the line
nnoremap('<leader>x', '0"_D')

-- Navigate through tabs
nnoremap('tk', '<cmd>tabprev<CR>')
nnoremap('tj', '<cmd>tabnext<CR>')
nnoremap('tn', '<cmd>tabnew<CR>')

-- Do not copy visually selected text when pasting over it
-- vnoremap <silent> p "_dP
vnoremap('p', '"_dP')
