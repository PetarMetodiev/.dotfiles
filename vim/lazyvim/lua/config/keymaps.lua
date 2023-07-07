-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function map(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

map("n", "<Left>", '<cmd>echoe "Use h"<CR>', { noremap = true, silent = true, desc = "Enforce proper vim motions" })
map("n", "<Right>", '<cmd>echoe "Use l"<CR>', { noremap = true, silent = true, desc = "Enforce proper vim motions" })
map("n", "<Down>", '<cmd>echoe "Use j"<CR>', { noremap = true, silent = true, desc = "Enforce proper vim motions" })
map("n", "<Up>", ":<C-U><Up>", { noremap = true, desc = "Retype last command" })

-- -- Insert empty space in normal mode
-- setmap("n", "<space>", ":", { noremap = true })
-- setmap("v", "<space>", ":", { noremap = true })
map({ "n", "v" }, "<BS>", ":", { noremap = true })
--
-- -- Going to the first character of the line is ofter times more needed
-- -- 0 is easier to press than Shift+6
map({ "n", "v" }, "^", "0", { noremap = true, silent = true, desc = "Move to beginning text on the line" })
map({ "n", "v" }, "0", "^", { noremap = true, silent = true, desc = "Move to the beginning of the line" })
--
-- -- Insert new line without entering insert mode
-- nnoremap("<CR>", "o<Esc>")
-- nnoremap("<S-CR>", "O<Esc>")
map("n", "<CR>", "o<Esc>", { noremap = true, silent = true, desc = "Add new line below in normal mode" })
map("n", "<S-CR>", "O<Esc>", { noremap = true, silent = true, desc = "Add new line above in normal mode" })

-- Use Ctrl+q to switch between last used buffer(Ctrl+TAB is not reliable in
-- all terminals)
map("n", "<C-q>", "<cmd>b#<CR>", { noremap = true, silent = true, desc = "Switch between last two buffers" })

-- Keep cursor position when joining lines with <S-j>
map("n", "J", "mzJ`z", { noremap = true, silent = true })

-- -- Wrapped lines are treated as multiple lines.
-- -- explanation https://youtu.be/hSHATqh8svM?t=319
-- vim.api.nvim_set_keymap(
-- 	"n",
-- 	"k",
-- 	[[v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk']],
-- 	{ noremap = true, expr = true, silent = true }
-- )
-- vim.api.nvim_set_keymap(
-- 	"n",
-- 	"j",
-- 	[[v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj']],
-- 	{ noremap = true, expr = true, silent = true }
-- )
--
-- -- Remap the default behaviour
-- nnoremap("<leader>j", "j")
-- nnoremap("<leader>k", "k")

-- Do not copy stuff when using c/C
map({ "v", "n" }, "c", '"_c', { noremap = true, silent = true })
map({ "v", "n" }, "C", '"_C', { noremap = true, silent = true })

-- Break undo chain when hitting these
-- explanation https://youtu.be/hSHATqh8svM?t=227
map("i", ",", ",<C-g>u", { noremap = true, silent = true })
map("i", ".", ".<C-g>u", { noremap = true, silent = true })
map("i", "(", "(<C-g>u", { noremap = true, silent = true })
map("i", ")", ")<C-g>u", { noremap = true, silent = true })
map("i", "{", "{<C-g>u", { noremap = true, silent = true })
map("i", "}", "}<C-g>u", { noremap = true, silent = true })
map("i", "+", "+<C-g>u", { noremap = true, silent = true })
map("i", "-", "-<C-g>u", { noremap = true, silent = true })
map("i", "*", "*<C-g>u", { noremap = true, silent = true })
map("i", "\\", "\\<C-g>u", { noremap = true, silent = true })
map("i", "?", "?<C-g>u", { noremap = true, silent = true })
map("i", "!", "!<C-g>u", { noremap = true, silent = true })

-- -- Clean line contents without delteing the line
-- nnoremap("<leader>x", '0"_D') - think about creating a command
map("n", "X", '0"_D', { noremap = true, silent = true, desc = "Clean line contents without deleting the line" })

-- Navigate through tabs
map("n", "tk", "<cmd>tabprev<CR>", { noremap = true, silent = true, desc = "Go to previous tab" })
map("n", "tj", "<cmd>tabnext<CR>", { noremap = true, silent = true, desc = "Go to next tab" })
map("n", "tn", "<cmd>tabnew<CR>", { noremap = true, silent = true, desc = "Create new tab" })

-- Do not copy visually selected text when pasting over it
map(
  "v",
  "p",
  '"_dP',
  { noremap = true, silent = true, desc = "Do not copy visually selected text when pasting over it" }
)
-- -- map C-U to C-Uzz <- always center the screen
-- -- do the same for C-D, C-o, C-i
