require('user/utils')

require('nvim-treesitter.configs').setup({
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
    'vim'
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
  }
})
