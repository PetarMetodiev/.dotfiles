local status_ok, neoclip = pcall(require, 'neoclip')
if not status_ok then
    print('Could not load neoclip')
    return
end

neoclip.setup({
    history = 1000,
    enable_persistent_history = false,
    continious_sync = false,
    db_path = vim.fn.stdpath('data') .. '/databases/neoclip.sqlite3',
    filter = nil,
    preview = true,
    default_register = '"',
    default_register_macros = 'q',
    enable_macro_history = true,
    content_spec_column = false,
    on_paste = {
        -- if set to true, pressing simply p will paste the last pasted item
        set_reg = false,
    },
    on_replay = {
        set_reg = false,
    },
    keys = {
        telescope = {
            i = {
                select = '<C-p>',
                paste = '<CR>',
                paste_behind = '<c-k>',
                replay = '<c-q>', -- replay a macro
                delete = '<c-d>', -- delete an entry
                custom = {},
            },
            n = {
                select = 'p',
                paste = '<cr>',
                paste_behind = 'P',
                replay = 'q',
                delete = 'd',
                custom = {},
            },
        },
    },
})

nnoremap('<C-r>', '<cmd>Telescope neoclip<CR>')
inoremap('<C-r>', '<cmd>Telescope neoclip<CR>')
