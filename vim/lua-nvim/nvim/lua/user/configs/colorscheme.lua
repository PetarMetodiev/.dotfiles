require('user/utils')

local M = {}
M.setup_onedark = function()
    local status_ok, onedark = pcall(require, 'onedarkpro')
    if not status_ok then
        vim.notify('Colorscheme onedarkpro is not found')
        return
    end

    onedark.setup({
        theme = 'onedark',
        colors = {
            yellow = '#F9FF8D',
            red = '#Cb4F10',
            green = '#52AD70',
            purple = '#B164C8',
            blue = '#83C0F2',
            cyan = '#39939F',
            white = '#ABB2BF',
            black = '#1e1e1e',
            gray = '#4C4F55',
            highlight = '#E2BE7D',
        },
        styles = {
            comments = 'italic',
            functions = 'NONE',
            keywords = 'bold,italic',
            strings = 'NONE',
            variables = 'NONE',
        },
        hlgroups = {
            CursorLine = { bg = '#2C323C' },
            MsgArea = { fg = 'cleared' },
            Pmenu = { bg = '#3E4452' },
            PmenuSel = { fg = '#282C34', bg = '#61AFEF' },
            PmenuSbar = { bg = '#3B4048' },
            PmenuThumb = { bg = '#ABB2Bf' },
            LineNr = { fg = 'LightGrey', bg = '#808080' },
            MatchParen = { bg = '#ee88ee', fg = '#23272e', style = 'bold' },
            NvimTreeOpenedFile = { bg = '#4C4F55', style = 'bold' },
        },
        options = {
            bold = true, -- Use the themes opinionated bold styles?
            italic = true, -- Use the themes opinionated italic styles?
            underline = false, -- Use the themes opinionated underline styles?
            undercurl = true, -- Use the themes opinionated undercurl styles?
            transparent = false, -- Use a transparent background?
            cursorline = true, -- Use cursorline highlighting?
        },
    })
    onedark.load()
end

M.setup_tokyonight = function()
    g.tokyonight_hide_inactive_statusline = true
    g.tokyonight_style = 'night'

    cmd([[colorscheme tokyonight]])
end

return M
