local status_ok, npairs = pcall(require, 'nvim-autopairs')
if not status_ok then
    print('Could not load nvim-autopairs')
    return
end

npairs.setup({
    check_ts = true,
    disable_filetype = { 'TelescopePrompt' },
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
    print('Could not load cmp inside nvim-autopairs config')
    return
end
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))

local Rule = require('nvim-autopairs.rule')

-- wtf is this black magic: https://github.com/windwp/nvim-autopairs/wiki/Custom-rules#add-spaces-between-parentheses
-- in short - add space padding when adding a bracket and then pressing spaace
npairs.add_rules({
    Rule(' ', ' '):with_pair(function(opts)
        local pair = opts.line:sub(opts.col - 1, opts.col)
        return vim.tbl_contains({ '()', '[]', '{}' }, pair)
    end),
    Rule('( ', ' )')
        :with_pair(function()
            return false
        end)
        :with_move(function(opts)
            return opts.prev_char:match('.%)') ~= nil
        end)
        :use_key(')'),
    Rule('{ ', ' }')
        :with_pair(function()
            return false
        end)
        :with_move(function(opts)
            return opts.prev_char:match('.%}') ~= nil
        end)
        :use_key('}'),
    Rule('[ ', ' ]')
        :with_pair(function()
            return false
        end)
        :with_move(function(opts)
            return opts.prev_char:match('.%]') ~= nil
        end)
        :use_key(']'),
})
