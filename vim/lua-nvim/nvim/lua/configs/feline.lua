require('utils')

local colors = { bg = '#12afff', fg = '#ffffff' }

local disable = {
  filetypes = {
    '^NvimTree$',
    '^packer$',
    '^startify$',
  }
} 

local force_inactive = {
  buftypes = {'terminal'},
  bufnames = {}
}

local update_triggers = {
  'VimEnter',
  'WinEnter',
  'BufWinEnter',
  'WinClosed',
  'FileChangedShellPost'
}

local components = {
  active = {},
  inactive = {}
}

table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})

-- table.insert(components.active[1], {
--     provider = function(winid, component, opts)
--       return tostring(#vim.api.nvim_list_wins())
--     end,
-- })

local git_branch = {
    provider = 'git_branch',
    -- enabled = function(winid)
    --   local ok, head pcall(api.nvim_buf_get_var, api.nvim_win_get_buf(winid), 'gitsigns_head')
    --   return not ok
    -- end,
    icon = ' ',
    hl = {
      fg = '#ffffff',
      bg = '#0000ff',
      style = 'bold'
    },
    left_sep = '█',
    right_sep = '█'
}

local file_info = {
  provider = {
    name = 'file_info',
    opts = {
      file_modified_icon = '  ',
      colored_icon = false,
    }
  },
}

local file_type = {
  provider = 'file_type'
}
table.insert(components.active[1], git_branch)
table.insert(components.active[2], file_info)
-- table.insert(components.active[2], file_type)
table.insert(components.active[3], { })

require('feline').setup({
    colors = colors,
    disable = disable,
    force_inactive = force_inactive,
    components = components
})
