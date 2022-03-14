require('user/utils')

local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
    print('Could not load nvim-tree')
    return
end

local tree_width = 30
local is_expanded = false
local function toggle_expanded()
    if is_expanded then
        cmd(':NvimTreeResize ' .. tree_width)
    else
        cmd(':NvimTreeResize 999')
    end

    is_expanded = not is_expanded
end

local list = {
    { key = { '<CR>', 'o', '<2-LeftMouse>' }, action = 'edit' },
    { key = '<C-e>', action = 'edit_in_place' },
    { key = { 'O' }, action = 'edit_no_picker' },
    { key = { 'C' }, action = 'cd' },
    { key = '<C-v>', action = 'vsplit' },
    { key = '<C-s>', action = 'split' },
    { key = '<C-t>', action = 'tabnew' },
    { key = '<', action = 'prev_sibling' },
    { key = '>', action = 'next_sibling' },
    { key = 'P', action = 'parent_node' },
    { key = 'x', action = 'close_node' },
    { key = '<Tab>', action = 'preview' },
    { key = 'K', action = 'first_sibling' },
    { key = 'J', action = 'last_sibling' },
    { key = 'I', action = 'toggle_ignored' },
    { key = 'H', action = 'toggle_dotfiles' },
    { key = 'R', action = 'refresh' },
    { key = 'a', action = 'create' },
    { key = 'd', action = 'remove' },
    { key = 'D', action = 'trash' },
    { key = 'r', action = 'rename' },
    { key = '<C-r>', action = 'full_rename' },
    { key = 'x', action = 'cut' },
    { key = 'c', action = 'copy' },
    { key = 'p', action = 'paste' },
    { key = 'y', action = 'copy_name' },
    { key = 'Y', action = 'copy_path' },
    { key = 'gy', action = 'copy_absolute_path' },
    { key = '[c', action = 'prev_git_item' },
    { key = ']c', action = 'next_git_item' },
    { key = 'u', action = 'dir_up' },
    { key = 's', action = 'system_open' },
    { key = 'q', action = 'close' },
    { key = 'g?', action = 'toggle_help' },
    { key = 'W', action = 'collapse_all' },
    { key = 'S', action = 'search_node' },
    { key = '.', action = 'run_file_command' },
    { key = '<C-k>', action = 'toggle_file_info' },
    { key = 'A', action = 'toggle_expanded', action_cb = toggle_expanded },
}

-- this option shows indent markers when folders are open
g.nvim_tree_indent_markers = 1

-- will enable file highlight for git attributes (can be used without the icons).
g.nvim_tree_git_hl = 1

g.nvim_tree_special_files = {
    Makefile = true,
    ['README.md'] = true,
    ['readme.md'] = true,
}

-- will enable folder and file icon highlight for opened files/directories.
g.nvim_tree_highlight_opened_files = 2

g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
        unstaged = '',
        staged = '✓',
        unmerged = '',
        renamed = '➜',
        untracked = '★',
        deleted = '',
    },
    folder = {
        arrow_open = '',
        arrow_closed = '',
        default = '',
        open = '',
        empty = '',
        empty_open = '',
        symlink = '',
        symlink_open = '',
    },
    lsp = {
        hint = '',
        info = '',
        warning = '',
        error = '',
    },
}

nvim_tree.setup({
    disable_netrw = false,
    hijack_netrw = true,
    open_on_setup = true,
    ignore_buffer_on_setup = false,
    ignore_ft_on_setup = {},
    auto_close = true,
    auto_reload_on_write = true,
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = true,
    hijack_unnamed_buffer_when_opening = false,
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = '',
            info = '',
            warning = '',
            error = '',
        },
    },
    update_focused_file = {
        enable = true,
        update_cwd = false,
        ignore_list = {},
    },
    system_open = {
        cmd = nil,
        args = {},
    },
    filters = {
        dotfiles = false,
        custom = {},
        exclude = { 'node_modules' },
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    view = {
        -- width = 30,
        -- height = 30,
        hide_root_folder = true,
        side = 'left',
        preserve_window_proportions = false,
        mappings = {
            custom_only = false,
            list = list,
        },
        number = true,
        relativenumber = true,
        signcolumn = 'yes',
    },
    trash = {
        cmd = 'trash',
        require_confirm = true,
    },
    actions = {
        change_dir = {
            enable = true,
            global = false,
        },
        open_file = {
            quit_on_open = false,
            resize_window = false,
            window_picker = {
                enable = true,
                chars = '1234567890abcdefghijklmnopqrstuvwxyz',
                exclude = {
                    filetype = { 'notify', 'packer', 'qf', 'diff', 'fugitive', 'fugitiveblame' },
                    buftype = { 'nofile', 'terminal', 'help' },
                },
            },
        },
    },
    log = {
        enable = false,
        truncate = false,
        types = {
            all = false,
            config = false,
            git = false,
        },
    },
})

nnoremap('<C-b>', '<cmd>NvimTreeFindFileToggle<CR>')
