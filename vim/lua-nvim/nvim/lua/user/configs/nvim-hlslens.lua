require('user/utils')

-- config without asterisk-z integration
-- nnoremap('n', '<Cmd>execute("norm! " . v:count1 . "n")<CR><Cmd>lua require("hlslens").start()<CR>')
-- nnoremap('N', '<Cmd>execute("norm! " . v:count1 . "N")<CR><Cmd>lua require("hlslens").start()<CR>')
-- nnoremap('*', '*<Cmd>lua require("hlslens").start()<CR>')
-- nnoremap('#', '#<Cmd>lua require("hlslens").start()<CR>')
-- nnoremap('g*', 'g*<Cmd>lua require("hlslens").start()<CR>')
-- nnoremap('g#', 'g#<Cmd>lua require("hlslens").start()<CR>')

api.nvim_set_keymap('n', '*', [[<Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>]], {})
api.nvim_set_keymap('n', '#', [[<Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>]], {})
api.nvim_set_keymap('n', 'g*', [[<Plug>(asterisk-gz*)<Cmd>lua require('hlslens').start()<CR>]], {})
api.nvim_set_keymap('n', 'g#', [[<Plug>(asterisk-gz#)<Cmd>lua require('hlslens').start()<CR>]], {})

require('hlslens').setup({
    -- remove highlight when the cursor moves outside of highlighted word
    calm_down = true,
    -- show virtual text only on the currently searched term and not on the previous or following ones
    -- nearest_only = true
})
