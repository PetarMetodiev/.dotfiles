-- Exposing globals may not be the best practise but seems ok for now.
api = vim.api
cmd = vim.cmd
opt = vim.opt
fn = vim.fn
g = vim.g
lsp = vim.lsp
setmap = api.nvim_set_keymap
generic_opts = { noremap = true, silent = true }

-- Avoid writing print(vim.inspect(...))
-- Source https://github.com/nanotee/nvim-lua-guide#tips-3
function _G.put(...)
    local objects = {}
    for i = 1, select('#', ...) do
        local v = select(i, ...)
        table.insert(objects, vim.inspect(v))
    end

    print(table.concat(objects, '\n'))
    return ...
end

function nnoremap(key, val)
    setmap('n', key, val, generic_opts)
end

function vnoremap(key, val)
    setmap('v', key, val, generic_opts)
end

function inoremap(key, val)
    setmap('i', key, val, generic_opts)
end

function xnoremap(key, val)
    setmap('x', key, val, generic_opts)
end

local M = {}

-- https://github.com/norcalli/nvim_utils/blob/master/lua/nvim_utils.lua#L554-L567
M.nvim_create_augroups = function(definitions)
    for group_name, definition in pairs(definitions) do
        api.nvim_command('augroup ' .. group_name)
        api.nvim_command('autocmd!')
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten({ 'autocmd', def }), ' ')
            api.nvim_command(command)
        end
        api.nvim_command('augroup END')
    end
end

M.safe_create_nvim_dir = function(dir_name)
    -- Explanation for vim.fn.stdpath - https://vi.stackexchange.com/a/28040
    if vim.fn.isdirectory(vim.fn.stdpath('config') .. '/' .. dir_name) == 0 then
        print('No /' .. dir_name .. ' dir! Creating ' .. vim.fn.stdpath('config') .. '/' .. dir_name)
        -- 448 is 0700 in decimal, got it from here https://github.com/nvim-lua/plenary.nvim/blob/4caca43f1bdacefc3f917eb143adf4d4c1bf55bd/lua/plenary/path.lua#L381
        -- in short - fs_mkdir requires mode permissions, which are the same as in chmod. See http://www.filepermissions.com/file-permission/0700
        -- the nil inside fs_mkdir should make it sync, ref https://github.com/luvit/luv/blob/master/docs.md#uvfs_mkdirpath-mode-callback
        vim.loop.fs_mkdir(vim.fn.stdpath('config') .. '/' .. dir_name, 448, nil)
        print('Created /' .. dir_name .. ' dir.')
    end
end

return M
