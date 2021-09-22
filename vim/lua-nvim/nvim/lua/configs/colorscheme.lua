require('utils')

local M = {}

M.setup_onedark = function()
  local onedark = require('onedark')
  onedark.setup({
      colors = {
        yellow = '#f9ff8d',
        red = '#cb4f10',
        green = '#52ad70',
        purple = '#b164c8',
        blue = '#83c0f2',
        cyan = "#39939f",
        white = "#abb2bf",
        black = "#1E1E1E",
        gray = "#4c4f55",
        highlight = "#e2be7d",
      };
      styles = {
        comments = 'italic',
        functions = 'NONE',
        keywords = 'bold,italic',
        strings = 'NONE',
        variables = 'NONE'
      };
      hlgroups = {
        CursorLine = { bg = '#2C323C' },
        MsgArea = { fg = 'cleared' },
        Pmenu = { bg='#3E4452' },
        PmenuSel = { fg='#282C34', bg='#61AFEF' },
        PmenuSbar = { bg='#3B4048' },
        PmenuThumb = { bg='#ABB2Bf' },
        LineNr = { fg='LightGrey', bg='#808080' },
        MatchParen = { bg='#ee88ee', fg='#23272e', style='bold' },
      }
    })
  onedark.load()
end

M.setup_tokyonight = function()
  g.tokyonight_hide_inactive_statusline = true
  vim.g.tokyonight_style = "storm"

  cmd([[colorscheme tokyonight]])
end

return M
