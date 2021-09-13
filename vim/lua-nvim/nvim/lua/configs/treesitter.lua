require('utils')

print('hello from treesitter config')
require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true, -- false will disable the whole extension
    -- additional_vim_regex_highlighting = true,
    -- disable = { "latex" },
  }
})
