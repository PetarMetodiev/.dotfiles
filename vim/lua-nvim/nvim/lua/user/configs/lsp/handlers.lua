local M = {}

M.setup = function()
    local signs = {
        { name = 'DiagnosticSignError', text = ' ' },
        { name = 'DiagnosticSignWarn', text = ' ' },
        { name = 'DiagnosticSignHint', text = ' ' },
        { name = 'DiagnosticSignInfo', text = ' ' },
    }

    for _, sign in ipairs(signs) do
        fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
    end

    local config = {
        virtual_text = {
            spacing = 1,
            prefix = ' ',
        },
        signs = {
            active = signs,
        },
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = 'minimal',
            border = 'rounded',
            source = 'always',
            header = '',
        },
    }

    vim.diagnostic.config(config)

    lsp.handlers['textDocument/hover'] = lsp.with(lsp.handlers.hover, {
        border = 'rounded',
    })

    lsp.handlers['textDocument/signatureHelp'] = lsp.with(lsp.handlers.signature_help, {
        border = 'rounded',
    })
end

-- Not sure if this would be useful. Will evaluate.
local function lsp_highlight_document(client)
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec(
            [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorHold <buffer> lua vim.diagnostic.open_float({ float = { border = "rounded" }})
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
            false
        )
    end
end

local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }
    api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    api.nvim_buf_set_keymap(
        bufnr,
        'n',
        'gk',
        '<cmd>lua vim.diagnostic.goto_prev({ float = { border = "rounded" }})<CR>',
        opts
    )
    api.nvim_buf_set_keymap(
        bufnr,
        'n',
        'gj',
        '<cmd>lua vim.diagnostic.goto_next({ float = { border = "rounded" }})<CR>',
        opts
    )
    cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

M.on_attach = function(client, bufnr)
    if client.name == 'tsserver' then
        local tsserver_opts = require('user/configs/lsp/settings/tsserver')
        tsserver_opts.on_attach(client)
    end

    if client.name == 'sumneko_lua' then
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
    end

    lsp_keymaps(bufnr)
    lsp_highlight_document(client)
end

local capabilities = lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not status_ok then
    print('Could not load cmp_nvim_lsp')
    return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
