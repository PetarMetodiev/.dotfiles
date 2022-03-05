local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever this file is saved
-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify('Could not load packer')
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float ({ border = "rounded" })
    end,
  },
}

return packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Should speed up startup time
  use {
    'lewis6991/impatient.nvim',
    config = function ()
      require('impatient')
    end
  }

  -- Magic
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('user/configs/treesitter')
    end
  }

  -- Essential for adding/removing/changing surrounding characters
  use 'tpope/vim-surround'

  -- Commenting
  use {
    "numToStr/Comment.nvim",
    config = function ()
      require("user/configs/comment")
    end
  }

  -- Context aware comments, useful for JSX
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Integrate with EditorConfig
  -- use 'editorconfig/editorconfig-vim'

  -- Exchange two text elements/blocks easily
  use 'tommcdo/vim-exchange'

  -- Place items in braces on new row each
  use {
    'FooSoft/vim-argwrap',
    config = function()
      require('user/configs/argwrap')
    end
  }

  -- Vim understands .tmux.conf¬
  use 'tmux-plugins/vim-tmux'

  -- Make autoread work in tmux¬
  use 'tmux-plugins/vim-tmux-focus-events'

  -- Jump between vim splits and tmux panes with the same key combination - C-k,
  -- C-j, C-h, C-l
  -- Needs to be configured in .tmux.conf as well
  use 'christoomey/vim-tmux-navigator'

  -- Session save and restore.
  -- Works great with tmux-resurrect and tmux-continuum
  -- use 'tpope/vim-obsession'

  -- Intellignetly remember last position in file
  use 'farmergreg/vim-lastplace'

  -- Colorful icons out of the box
  use {
    'kyazdani42/nvim-web-devicons',
    config = function()
      require('user/configs/nvim-web-devicons')
    end
  }

  -- Repeat with '.' surroundings
  use 'tpope/vim-repeat'

  -- Automatically close html tags
  use 'alvan/vim-closetag'

  use {
    "windwp/nvim-autopairs",
    config = function ()
      require('user/configs/autopairs')
    end
  }

  use {
    'kevinhwang91/nvim-hlslens',
    config = function()
      require('user/configs/nvim-hlslens')
    end
  }

  -- Tree navigation
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('user/configs/nvim-tree')
    end
  }

  -- Pretty statusline
  -- use {
  --   'famiu/feline.nvim',
  --   config = function()
  --     require('user/configs/feline')
  --   end,
  --   -- git signs slows down startup time!
  --   requires = {
  --     {
	-- 'lewis6991/gitsigns.nvim',
	-- requires = { 'nvim-lua/plenary.nvim' },
	-- config = function()
	--   require('gitsigns').setup()
	-- end
  --     },
  --     'kyazdani42/nvim-web-devicons'
  --   }
  -- }
  -- use 'sheerun/vim-polyglot'

  -- Completion
  use {
    "hrsh7th/nvim-cmp",
    config = function()
      require('user/configs/cmp')
    end,
    requires = {
      'hrsh7th/cmp-buffer', -- buffer completions
      'hrsh7th/cmp-path', -- path completions
      'hrsh7th/cmp-cmdline', -- cmdline completions
      'saadparwaiz1/cmp_luasnip', -- snippet completions
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      -- Integrate with built-in lsp
      {
	'neovim/nvim-lspconfig',
	config = function ()
	  require('user/configs/lsp')
	end
      },
      -- Simple to use language server installer
      'williamboman/nvim-lsp-installer',

    }
  }

  use 'jose-elias-alvarez/nvim-lsp-ts-utils'

  -- Fancy git symbols in the line number column
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function ()
      require("user/configs/gitsigns")
    end
  }

  -- Snippets
  -- Snippet engine
  use "L3MON4D3/LuaSnip"
  -- A bunch of snippets to use
  use "rafamadriz/friendly-snippets"

  -- Fuzzy everything
  use {
    "nvim-telescope/telescope.nvim",
    config = function ()
      require('user/configs/telescope')
    end,
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  use {
    'folke/tokyonight.nvim',
    config = function()
      require("user/configs/colorscheme").setup_tokyonight()
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
