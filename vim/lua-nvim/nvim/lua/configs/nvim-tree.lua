local utils = require('utils')
local tree_width = 30

--30 by default, can be width_in_columns or 'width_in_percent%'
g.nvim_tree_width = tree_width

g.nvim_tree_ignore = { '.git', '.cache' }

-- don't auto open tree on specific filetypes.
g.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' }

-- will update the path of the current dir if the file is not inside the tree.
-- g.nvim_tree_follow_update_path = 1

-- this option shows indent markers when folders are open
g.nvim_tree_indent_markers = 1

-- will enable file highlight for git attributes (can be used without the icons).
g.nvim_tree_git_hl = 1

-- will enable folder and file icon highlight for opened files/directories.
g.nvim_tree_highlight_opened_files = 3

-- g.nvim_tree_root_folder_modifier = ':~' --This is the default. See :help filename-modifiers for more options

-- List of filenames that gets highlighted with NvimTreeSpecialFile
-- There is some kind of bug - removing this line, removes README.md icon
g.nvim_tree_special_files = { 'README.md'; 'Makefile'; 'MAKEFILE'; }

nnoremap('<C-b>', ':<C-U>NvimTreeToggle<CR>')

local is_expanded = false
function toggle_expanded()
  if is_expanded then
    cmd(':NvimTreeResize ' .. tree_width)
  else
    cmd(':NvimTreeResize "100%"')
  end

  is_expanded = not is_expanded
end

local is_number_visible = false
function toggle_line_numbers()
  is_number_visible = not is_number_visible
  -- Display relative line numbers
  vim.wo.number = is_number_visible
  -- Display absolute line numbers
  vim.wo.relativenumber = is_number_visible
  -- Hide signcoloumn as it takes too much space
  vim.wo.signcolumn = is_number_visible and 'no' or 'yes' -- lua version of ternary
end

local tree_cb = require'nvim-tree.config'.nvim_tree_callback

vim.g.nvim_tree_bindings = {
  { key = 'C',                            cb = tree_cb('cd') },
  { key = '<C-v>',                        cb = tree_cb('vsplit') },
  { key = '<C-s>',                        cb = tree_cb('split') },
  { key = '<C-t>',                        cb = tree_cb('tabnew') },
  { key = '<',                            cb = tree_cb('prev_sibling') },
  { key = '>',                            cb = tree_cb('next_sibling') },
  { key = 'P',                            cb = tree_cb('parent_node') },
  { key = 'x',                            cb = tree_cb('close_node') },
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
  { key = 'A',                            cb = ':lua toggle_expanded()<cr>' },
  { key = 'gn',                           cb = ':lua toggle_line_numbers()<cr>' },
  { key = 'g?',                           cb = tree_cb('toggle_help') },
}

require'nvim-tree'.setup ({
  -- open the tree when running this setup function
  open_on_setup       = true,
  -- closes neovim automatically when the tree is the last **WINDOW** in the view
  auto_close          = true,
  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
  open_on_tab         = true,
  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor       = false,
  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually) 
  update_cwd          = true,
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    -- enables the feature
    enable      = true,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd  = true,
  },
})
