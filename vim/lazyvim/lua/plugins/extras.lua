return {
  { "tpope/vim-surround" },
  { "tommcdo/vim-exchange" },
  {
    "EdenEast/nightfox.nvim",
    opts = {
      groups = {
        duskfox = {},
      },
      options = {
        dim_inactive = true, -- Non focused panes set to alternative background
        colorblind = {
          enable = true, -- Enable colorblind support
          simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
          severity = {
            protan = 0.5, -- Severity [0,1] for protan (red)
            deutan = 0.2, -- Severity [0,1] for deutan (green)
            tritan = 0.5, -- Severity [0,1] for tritan (blue)
          },
        },
        styles = {
          comments = "italic",
          types = "italic",
          functions = "bold",
          constants = "bold,italic",
          keywords = "italic",
        },
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "duskfox",
    },
  },

  {
    "christoomey/vim-tmux-navigator",
    event = "BufReadPre",
  },

  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      -- {"kkharji/sqlite.lua", enabled = not jit.os:find("Windows")},
    },
    init = function()
      require("neoclip").setup({
        -- this throws an error because of reasons...
        -- enable_persistent_history = true,
        continuous_sync = true,
        keys = {
          telescope = {
            i = {
              paste_behind = "<CR>",
            },
            n = {
              paste_behind = "<CR>",
            },
          },
        },
      })
      require("telescope").load_extension("neoclip")
    end,
    keys = {
      {
        '"',
        function()
          local opts = require("telescope.themes").get_dropdown(require("telescope.config").values)
          opts.initial_mode = "normal"
          return require("telescope").extensions.neoclip.default(opts)
        end,
        noremap = true,
        silent = true,
        desc = "Open clipboard manager",
      },
      {
        "<C-r>",
        function()
          local opts = require("telescope.themes").get_dropdown(require("telescope.config").values)
          opts.initial_mode = "normal"
          return require("telescope").extensions.neoclip.default(opts)
        end,
        noremap = true,
        silent = true,
        desc = "Open clipboard manager",
        mode = "i",
      },
    },
  },

  {
    "FooSoft/vim-argwrap",
    keys = {
      {
        "<leader>a",
        "<cmd>ArgWrap<CR>",
        noremap = true,
        silent = true,
        desc = "Wrap and unwrap stuff in parens",
      },
    },
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      -- https://github.com/windwp/nvim-autopairs/wiki/Custom-rules#add-spaces-between-parentheses
      local npairs = require("nvim-autopairs")
      -- Calling setup() manually was the only way to make the plugin play nice with lazy.nvim
      npairs.setup({ check_ts = true })
      local Rule = require("nvim-autopairs.rule")
      local brackets = { { "(", ")" }, { "[", "]" }, { "{", "}" } }
      npairs.add_rules({
        Rule(" ", " "):with_pair(function(opts)
          local pair = opts.line:sub(opts.col - 1, opts.col)
          return vim.tbl_contains({
            brackets[1][1] .. brackets[1][2],
            brackets[2][1] .. brackets[2][2],
            brackets[3][1] .. brackets[3][2],
          }, pair)
        end),
      })
      for _, bracket in pairs(brackets) do
        npairs.add_rules({
          Rule(bracket[1] .. " ", " " .. bracket[2])
            :with_pair(function()
              return false
            end)
            :with_move(function(opts)
              return opts.prev_char:match(".%" .. bracket[2]) ~= nil
            end)
            :use_key(bracket[2]),
        })
      end
    end,
  },

  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()

      keys[#keys + 1] = {
        "gk",
        function()
          vim.diagnostic.goto_prev({ float = { border = "rounded" } })
        end,
        noremap = true,
        silent = true,
        desc = "Go to previous diagnostic",
      }

      keys[#keys + 1] = {
        "gj",
        function()
          vim.diagnostic.goto_next({ float = { border = "rounded" } })
        end,
        noremap = true,
        silent = true,
        desc = "Go to next diagnostic",
      }

      keys[#keys + 1] = {
        "ga",
        vim.lsp.buf.code_action,
        noremap = true,
        silent = true,
        desc = "Code Action",
        mode = { "n", "v" },
        has = "codeAction",
      }
    end,
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        stylelint_lsp = {
          filetypes = {
            "css",
            "less",
            "scss",
            "sugarss",
            "vue",
            "wxss",
            "javascriptreact",
            "typescriptreact",
          },
        },
        cssls = {
          settings = {
            css = {
              validate = true,
              lint = {
                unknownAtRules = "ignore",
              },
            },
            scss = {
              validate = true,
              lint = {
                unknownAtRules = "ignore",
              },
            },
          },
        },
        css_variables = {},
        typos_lsp = {},
        custom_elements_ls = {
          filetypes = {
            "html",
            "typescript",
            "javascript",
          },
        },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "css",
        "scss",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "json5",
        "lua",
        "tsx",
        "typescript",
        "vim",
      },
      autopairs = {
        enable = true,
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
      },
      autotag = {
        enable = true,
      },
      indent = { enable = true, disable = { "yaml" } },
      textobjects = {
        select = {
          enable = true,

          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["ac"] = "@comment.outer",
            ["ic"] = "@comment.inner",
          },
        },
      },
    },
  },

  {
    -- This is not loaded as described in the docs - the recommended way of installing this extension breaks telescope.
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<CR>"] = cmp.mapping.confirm({
          select = false,
          behavior = cmp.ConfirmBehavior.Replace,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s" }),
      })
      opts.preselect = cmp.PreselectMode.Item
      opts.experimental.ghost_text = false

      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }
      opts.completion.completeopt = "menu,menuone,noselect"

      opts.sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
      })
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      local mode = {
        "mode",
        fmt = function(str)
          return str:sub(1, 1)
        end,
      }

      local simple_filename = {
        "filename",
        file_status = false,
        path = 0,
      }

      local filename = {
        "filename",
        file_status = true, -- Displays file status (readonly status, modified status)
        -- 0: Just the filename
        -- 1: Relative path
        -- 2: Absolute path
        path = 1,

        shorting_target = 40, -- Shortens path to leave 40 spaces in the window
        symbols = {
          modified = "", -- Text to show when the file is modified.
          readonly = "", -- Text to show when the file is non-modifiable or readonly.
          unnamed = "[No Name]", -- Text to show for unnamed buffers.
        },
      }

      local filetype = {
        "filetype",
        icon_only = true, -- Display only an icon for filetype
        colored = false,
      }

      local diagnostics = {
        "diagnostics",
        colored = false, -- Displays diagnostics status in color if set to true.
        always_visible = true, -- Show diagnostics even if there are none.
      }

      local macro_mode_text = function()
        local reg = vim.fn.reg_recording()
        if reg == "" then
          return ""
        end -- not recording
        return reg
      end

      local macro_mode = {
        macro_mode_text,
        color = { fg = "#ffffff", bg = "#ff0000", gui = "bold" },
        icon = "[󰑊 REC]",
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
        local scroll_positions = { "⎺", "⎻", "─", "⎼", "⎽" }

        local row = string.format("%3d", unpack(vim.api.nvim_win_get_cursor(0)))
        local total_rows = vim.api.nvim_buf_line_count(vim.api.nvim_win_get_buf(0))

        local pos = row .. "/" .. total_rows

        local percent_pos = math.ceil((row - 1) / total_rows * 100)
        local percent_str = string.format("%3d%%%%", percent_pos)

        local scroll_symbol = get_scroll_position(percent_pos, scroll_positions)

        return pos .. " " .. percent_str .. " " .. scroll_symbol
      end

      return {
        options = {
          globalstatus = false,
          icons_enabled = true,
          theme = "papercolor_light",
          disabled_filetypes = {
            statusline = {
              "dashboard",
              "alpha",
            },
            winbar = { "gitcommit", "neo-tree" },
            "NvimTree",
          },
          always_divide_middle = true,
        },
        sections = {
          lualine_a = {
            mode,
          },
          lualine_b = { "branch" },
          lualine_c = {
            filename,
          },
          lualine_x = {
            filetype,
          },
          lualine_y = {
            macro_mode,
          },
          lualine_z = {
            rows,
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { filename },
          lualine_x = { filetype },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {
          lualine_a = {
            {
              "tabs",
              -- 0: Shows tab_nr
              -- 1: Shows tab_name
              -- 2: Shows tab_nr + tab_name
              mode = 2,
              tabs_color = {
                -- Same values as the general color option can be used here.
                active = "lualine_a_normal", -- Color for active tab.
                inactive = "lualine_b_normal", -- Color for inactive tab.
              },
            },
          },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = { simple_filename },
          lualine_z = {},
        },
        winbar = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { diagnostics },
        },
        inactive_winbar = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { filename },
          lualine_x = {},
          lualine_y = {},
          lualine_z = { diagnostics },
        },
        extensions = { "neo-tree", "lazy" },
      }
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "││" },
        change = { text = "│" },
        changedelete = { text = "▎" },
        delete = { text = " " },
        topdelete = { text = " " },
        untracked = { text = "󰐕 " },
      },
      preview_config = {
        -- Options passed to nvim_open_win
        border = "rounded",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
    },
  },

  {
    "norcalli/nvim-colorizer.lua",
    keys = {
      {
        "<leader>cc",
        "<cmd>ColorizerToggle<CR>",
        noremap = true,
        silent = true,
        desc = "Toggle color highlights",
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        scroll_strategy = "limit",
        path_display = { "absolute" },
        layout_strategy = "vertical",
        dynamic_preview_title = true,
        preview = {
          msg_bg_fillchar = " ",
        },
        winblend = 15,
        wrap_results = true,
        mappings = {
          i = {
            ["<C-s>"] = require("telescope.actions").select_horizontal,

            ["<C-v>"] = require("telescope.actions").select_vertical,
            ["<C-t>"] = require("telescope.actions").select_tab,

            ["<C-u>"] = require("telescope.actions").preview_scrolling_up,
            ["<C-d>"] = require("telescope.actions").preview_scrolling_down,

            ["<C-Down>"] = function(...)
              return require("telescope.actions").cycle_history_next(...)
            end,
            ["<C-Up>"] = function(...)
              return require("telescope.actions").cycle_history_prev(...)
            end,
          },
          n = {
            ["q"] = function(...)
              return require("telescope.actions").close(...)
            end,
            ["<C-p>"] = require("telescope.actions.layout").toggle_preview,
            ["<C-l>"] = require("telescope.actions.layout").cycle_layout_next,
            ["<C-s>"] = require("telescope.actions").file_split,
            ["<C-v>"] = require("telescope.actions").file_vsplit,
            ["<C-t>"] = require("telescope.actions").select_tab,
            ["gg"] = require("telescope.actions").move_to_top,
            ["G"] = require("telescope.actions").move_to_bottom,
            ["<C-u>"] = require("telescope.actions").preview_scrolling_up,
            ["<C-d>"] = require("telescope.actions").preview_scrolling_down,
          },
        },
      },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      close_if_last_window = true,
      window = {
        mappings = {
          ["<c-s>"] = "open_split",
          ["<c-v>"] = "open_vsplit",
          ["s"] = "none",
          ["x"] = "close_node",
        },
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },
        window = {
          mappings = {
            ["u"] = "navigate_up",
            ["C"] = "set_root",
            ["H"] = "toggle_hidden",
            ["/"] = "none",
            ["D"] = "none",
            ["#"] = "none", -- fuzzy sorting using the fzy algorithm
            ["f"] = "none",
            ["z"] = "none",
            ["<c-x>"] = "clear_filter",
            ["[g"] = "prev_git_modified",
            ["]g"] = "next_git_modified",
          },
        },
        filtered_items = {
          visible = true, -- always show hidden files
        },
      },
      default_component_configs = {
        icon = {
          folder_empty = "",
          folder_empty_open = "",
        },
        git_status = {
          symbols = {
            modified = "",
            conflict = "",
            unstaged = "󰓛",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "",
            deleted = "",
          },
        },
      },
    },
  },

  {
    "folke/flash.nvim",
    opts = {
      modes = {
        search = {
          enabled = false,
        },
        char = {
          jump_labels = true,
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      max_lines = 8,
      separator = "-",
    },
  },

  {
    "folke/tokyonight.nvim",
    opts = {
      on_highlights = function(hl)
        hl.TelescopePromptBorder = hl.TelescopeBorder
        hl.TelescopePromptTitle = hl.TelescopeNormal
      end,
    },
  },

  {
    "echasnovski/mini.indentscope",
    opts = {
      draw = { animation = require("mini.indentscope").gen_animation.none() },
    },
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = {},
      },
    },
  },

  {
    "MeanderingProgrammer/markdown.nvim",
    opts = {
      code = {
        sign = true,
        width = "full",
        right_pad = 0,
      },
      heading = {
        sign = true,
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      },
    },
  },

  {
    "rachartier/tiny-glimmer.nvim",
    event = "TextYankPost",
    opts = {
      enable = true,
      animations = {
        fade = {
          max_duration = 200,
          from_color = "@text.warning",
        },
      },
    },
  },
}
