require('user/utils')

local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    print('Could not load nvim-treesitter')
    return
end

configs.setup({
    ensure_installed = {
        'bash',
        'css',
        'scss',
        'html',
        'javascript',
        'jsdoc',
        'json',
        'json5',
        'lua',
        'tsx',
        'typescript',
        'vim',
    },
    sync_install = false,
    autopairs = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm',
        },
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    autotag = {
        enable = true,
    },
    indent = { enable = true, disable = { 'yaml' } },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    textobjects = {
        select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@comment.outer',
            },
        },
    },
})
