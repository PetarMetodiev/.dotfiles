local utils = require('utils')

--30 by default, can be width_in_columns or 'width_in_percent%'
g.nvim_tree_width = 40

g.nvim_tree_ignore = { '.git', '.cache' }

-- when moving cursor in the tree, will position the cursor at the start of the file on the current line
g.nvim_tree_hijack_cursor = 0

-- opens the tree when typing `vim $DIR` or `vim`
g.nvim_tree_auto_open = 1

-- closes the tree when it's the last window
g.nvim_tree_auto_close = 1

-- don't auto open tree on specific filetypes.
g.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' }

-- will update the path of the current dir if the file is not inside the tree.
g.nvim_tree_follow_update_path = 1

-- this option shows indent markers when folders are open
g.nvim_tree_indent_markers = 1

-- will enable file highlight for git attributes (can be used without the icons).
g.nvim_tree_git_hl = 1

-- will enable folder and file icon highlight for opened files/directories.
g.nvim_tree_highlight_opened_files = 3

-- g.nvim_tree_root_folder_modifier = ':~' --This is the default. See :help filename-modifiers for more options

-- will open the tree when entering a new tab and the tree was previously open
g.nvim_tree_tab_open = 1

-- List of filenames that gets highlighted with NvimTreeSpecialFile
-- There is some kind of bug - removing this line, removes README.md icon
g.nvim_tree_special_files = { 'README.md'; 'Makefile'; 'MAKEFILE'; }

nnoremap('<C-b>', ':<C-U>NvimTreeToggle<CR>')
local tree_cb = require'nvim-tree.config'.nvim_tree_callback

vim.g.nvim_tree_bindings = {
  { key = 'c',    cb = tree_cb('cd') },
  { key = '<C-v>',                        cb = tree_cb('vsplit') },
  { key = '<C-s>',                        cb = tree_cb('split') },
  { key = '<C-t>',                        cb = tree_cb('tabnew') },
  { key = '<',                            cb = tree_cb('prev_sibling') },
  { key = '>',                            cb = tree_cb('next_sibling') },
  { key = 'P',                            cb = tree_cb('parent_node') },
  { key = 'x',                         cb = tree_cb('close_node') },
  { key = '<S-CR>',                       cb = tree_cb('close_node') },
  { key = 'R',                            cb = tree_cb('refresh') },
  { key = 'a',                            cb = tree_cb('create') },
  { key = 'd',                            cb = tree_cb('remove') },
  { key = 'r',                            cb = tree_cb('rename') },
  { key = '<C-r>',                        cb = tree_cb('full_rename') },
  { key = 'c',                            cb = tree_cb('copy') },
  { key = 'p',                            cb = tree_cb('paste') },
  { key = 'y',                            cb = tree_cb('copy_name') },
  { key = 'Y',                            cb = tree_cb('copy_path') },
  { key = 'gy',                           cb = tree_cb('copy_absolute_path') },
  { key = 'u',                            cb = tree_cb('dir_up') },
  { key = 's',                            cb = tree_cb('system_open') },
  { key = 'q',                            cb = tree_cb('close') },
  { key = 'g?',                           cb = tree_cb('toggle_help') },
}
