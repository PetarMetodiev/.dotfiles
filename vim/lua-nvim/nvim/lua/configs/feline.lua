require('utils')

local get_scroll_position = function(percent, scroll_positions)
  local step = 100 / #scroll_positions

  if percent == 0 then
    return scroll_positions[1]
  end

  if percent == 100 then
    return scroll_positions[#scroll_positions]
  end

  local index = math.floor(percent / step) + 1

  return scroll_positions[index]
end

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
  'BufWinEnter',
  'WinEnter',
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
table.insert(components.inactive, {})

local git_branch = {
    provider = 'git_branch',
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
      file_modified_icon = '',
    },
  },
  icon = ''
}

local file_icon = {
  provider = 'file_icon'
}

local vertical_position = {
  provider = 'vertical_position',
  hl = {
    fg = '#ffffff',
    bg = '#0000ff',
    style = 'bold'
  },
  left_sep = '█',
  right_sep = '█'
}

local inactive_file_info = {
  provider = {
    name = 'file_info',
    opts = {
      file_modified_icon = '',
      type = 'full-path'
    },
  },
  icon = '',
  hl = {
    fg = '#000000',
    bg = '#ffffff'
  }
}

local inactive_file_icon = {
  provider = 'file_icon',
  hl = {
    fg = '#000000',
    bg = '#ffffff'
  }
}

table.insert(components.active[1], git_branch)
table.insert(components.active[2], file_info)
table.insert(components.active[3], file_icon)
table.insert(components.active[3], vertical_position)
table.insert(components.inactive[1], inactive_file_info)
table.insert(components.inactive[1], inactive_file_icon)

local custom_providers = {
  file_icon = function(winid, component)
    local filename = api.nvim_buf_get_name(api.nvim_win_get_buf(winid))
    local extension = fn.fnamemodify(filename, ':e')

    local icon_str = require("nvim-web-devicons").get_icon(
      filename,
      extension,
      { default = true }
      )

    return ' ' ..icon_str .. ' '
  end,

  vertical_position = function(winid, component, opts)
    local scroll_positions = { '⎺', '⎻', '─', '⎼', '⎽' }

    local row = string.format('%3d', unpack(api.nvim_win_get_cursor(winid)))
    local total_rows = api.nvim_buf_line_count(api.nvim_win_get_buf(winid))

    local pos = row .. '/' .. total_rows

    local percent_pos = math.ceil((row - 1) / total_rows * 100)
    local percent_str = string.format('%3d%%%%', percent_pos)

    local scroll_symbol = get_scroll_position(percent_pos, scroll_positions)

    return percent_str .. '  ' .. pos .. ' ' .. scroll_symbol
  end
}

require('feline').setup({
    colors = colors,
    disable = disable,
    update_triggers = update_triggers,
    force_inactive = force_inactive,
    custom_providers = custom_providers,
    components = components
})
