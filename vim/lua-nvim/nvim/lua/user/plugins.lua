local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

-- Install Packer if needed
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  print('Installing Packer...')
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

return require('packer').startup({function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Magic
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('configs.treesitter')
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
      require('configs.argwrap')
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
      require('configs.nvim-web-devicons')
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
      require('configs.nvim-hlslens')
    end
  }

  -- Tree navigation
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('configs.nvim-tree')
    end
  }

  -- Pretty statusline
  use {
    'famiu/feline.nvim',
    config = function()
      require('configs.feline')
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
      require('configs.colorscheme').setup_onedark()
    end
  }

end,

config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end
  }
}})
