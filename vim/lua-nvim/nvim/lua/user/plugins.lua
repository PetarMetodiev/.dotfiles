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
  vim.notify('There was a problem loading packer.')
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

  -- Magic
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('user/configs/treesitter')
    end
  }

  -- Integrate with built-in lsp
  use 'neovim/nvim-lspconfig'

  -- Essential for adding/removing/changing surrounding characters
  use 'tpope/vim-surround'

  -- Commenting
  use 'tomtom/tcomment_vim'

  -- Integrate with EditorConfig
  use 'editorconfig/editorconfig-vim'

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
  use 'tpope/vim-obsession'

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

  -- Auto pair plugin. It is quite complex and may turn out to be buggy overkill.
  use {
    'steelsojka/pears.nvim',
    config = function()
      require('pears').setup()
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
  use {
    'famiu/feline.nvim',
    config = function()
      require('user/configs/feline')
    end,
    -- git signs slows down startup time!
    requires = {
      {
	'lewis6991/gitsigns.nvim',
	requires = { 'nvim-lua/plenary.nvim' },
	config = function()
	  require('gitsigns').setup()
	end
      },
      'kyazdani42/nvim-web-devicons'
    }
  }
  -- use 'sheerun/vim-polyglot'

  use {
    'olimorris/onedarkpro.nvim',
    config = function()
      require('user/configs/colorscheme').setup_onedark()
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
