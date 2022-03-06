local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
    print('Could not load lualine')
    return
end

print('Add configuration for lualine')
local mode = {
    'mode',
    fmt = function(str)
        return str:sub(1, 1)
    end,
}
local filename = {
    'filename',
    file_status = true, -- Displays file status (readonly status, modified status)
    path = 1, -- 0: Just the filename
    -- 1: Relative path
    -- 2: Absolute path

    shorting_target = 40, -- Shortens path to leave 40 spaces in the window
    symbols = {
        modified = ' ', -- Text to show when the file is modified.
        readonly = '  ', -- Text to show when the file is non-modifiable or readonly.
        unnamed = '[No Name]', -- Text to show for unnamed buffers.
    },
}
local filetype = {
    'filetype',
    icon_only = true, -- Display only an icon for filetype
}
local diagnostics = {
    'diagnostics',
    colored = false, -- Displays diagnostics status in color if set to true.
    always_visible = true, -- Show diagnostics even if there are none.
}

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

local function rows()
    -- local row = string.format('%3d', unpack(api.nvim_win_get_cursor(winid)))
    -- local total_rows = api.nvim_buf_line_count(api.nvim_win_get_buf(winid))
    -- local pos = row .. '/' .. total_rows

    -- return pos

    local scroll_positions = { '⎺', '⎻', '─', '⎼', '⎽' }

    local row = string.format('%3d', unpack(api.nvim_win_get_cursor(0)))
    local total_rows = api.nvim_buf_line_count(api.nvim_win_get_buf(0))

    local pos = row .. '/' .. total_rows

    local percent_pos = math.ceil((row - 1) / total_rows * 100)
    local percent_str = string.format('%3d%%%%', percent_pos)

    local scroll_symbol = get_scroll_position(percent_pos, scroll_positions)

    return pos .. ' ' .. percent_str .. ' ' .. scroll_symbol
end

lualine.setup({
    options = {
        icons_enabled = true,
        theme = 'papercolor_light',
        disabled_filetypes = { 'NvimTree' },
        always_divide_middle = true,
    },
    sections = {
        lualine_a = {
            mode,
        },
        lualine_b = { 'branch' },
        lualine_c = {
            filename,
        },
        lualine_x = {
            filetype,
        },
        lualine_y = {},
        lualine_z = {
            rows,
        },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { filename },
        lualine_x = {
            {
                'filetype',
                icon_only = true, -- Display only an icon for filetype
                colored = false,
            },
        },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {
        lualine_a = {
            {
                'tabs',
                -- 0: Shows tab_nr
                -- 1: Shows tab_name
                -- 2: Shows tab_nr + tab_name
                mode = 2,
                tabs_color = {
                    -- Same values as the general color option can be used here.
                    active = 'lualine_a_normal', -- Color for active tab.
                    inactive = 'lualine_c_normal', -- Color for inactive tab.
                },
            },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { diagnostics },
    },
})
