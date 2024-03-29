local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
    print('Could not load Telescope')
    return
end

local actions = require('telescope.actions')
local action_layout = require('telescope.actions.layout')

telescope.setup({
    defaults = {
        prompt_prefix = '  ',
        selection_caret = ' ',
        scroll_strategy = 'limit',
        path_display = { 'absolute' },
        layout_strategy = 'vertical',
        dynamic_preview_title = true,
        preview = {
            filesize_limit = 1,
            -- msg_bg_fillchar = ''
            msg_bg_fillchar = ' ',
        },
        mappings = {
            i = {
                ['<C-n>'] = actions.cycle_history_next,
                ['<C-p>'] = actions.cycle_history_prev,

                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous,

                ['<C-c>'] = actions.close,

                ['<Down>'] = actions.move_selection_next,
                ['<Up>'] = actions.move_selection_previous,

                ['<CR>'] = actions.select_default,
                ['<C-s>'] = actions.select_horizontal,
                ['<C-v>'] = actions.select_vertical,
                ['<C-t>'] = actions.select_tab,

                ['<C-u>'] = actions.preview_scrolling_up,
                ['<C-d>'] = actions.preview_scrolling_down,

                ['<PageUp>'] = actions.results_scrolling_up,
                ['<PageDown>'] = actions.results_scrolling_down,

                ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
                ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
                ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
                ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
                ['<C-l>'] = actions.complete_tag,
                ['<C-_>'] = actions.which_key, -- keys from pressing <C-/>
            },

            n = {
                ['<esc>'] = actions.close,
                ['<C-p>'] = action_layout.toggle_preview,
                ['<C-l>'] = action_layout.cycle_layout_next,
                ['<CR>'] = actions.select_default,
                ['<C-s>'] = actions.select_horizontal,
                ['<C-v>'] = actions.select_vertical,
                ['<C-t>'] = actions.select_tab,

                ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
                ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
                ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
                ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,

                ['j'] = actions.move_selection_next,
                ['k'] = actions.move_selection_previous,
                ['H'] = actions.move_to_top,
                ['M'] = actions.move_to_middle,
                ['L'] = actions.move_to_bottom,

                ['<Down>'] = actions.move_selection_next,
                ['<Up>'] = actions.move_selection_previous,
                ['gg'] = actions.move_to_top,
                ['G'] = actions.move_to_bottom,

                ['<C-u>'] = actions.preview_scrolling_up,
                ['<C-d>'] = actions.preview_scrolling_down,

                ['<PageUp>'] = actions.results_scrolling_up,
                ['<PageDown>'] = actions.results_scrolling_down,

                ['?'] = actions.which_key,
            },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            -- the default case_mode is "smart_case"
            case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
        },
    },
})

telescope.load_extension('fzf')
telescope.load_extension('neoclip')

_G.project_files = function()
    local opts = {} -- define here if you want to define something
    local ok = pcall(require('telescope.builtin').git_files, opts)
    if not ok then
        require('telescope.builtin').find_files(opts)
    end
end

nnoremap('<C-p>', [[<cmd>lua project_files()<CR>]])
nnoremap('<C-f>', "<cmd>lua require'telescope.builtin'.buffers({ sort_mru = true })<cr>")
nnoremap('<leader>F', [[<cmd>Telescope live_grep<CR>]])
nnoremap('<leader>f', [[<cmd>Telescope grep_string<CR>]])

nnoremap('gd', '<cmd>Telescope lsp_definitions<CR>')
nnoremap('gr', '<cmd>Telescope lsp_references<CR>')
nnoremap('ga', '<cmd>Telescope lsp_code_actions<CR>')
