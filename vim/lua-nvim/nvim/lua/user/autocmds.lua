local utils = require('user/utils')

local autocmds = {
  formatoptions = {
    -- do not continue comment using o or o
    -- why use augroup: https://vi.stackexchange.com/a/1985
    -- solution found here: https://github.com/LunarVim/Neovim-from-scratch/pull/65/files
    { 'BufEnter', '*', 'set formatoptions-=o' };
  };
  -- may not be needed as tmux is handling this
  background_colors = {
    { 'focusgained', '*', 'highlight normal guibg=#282c34' };
    { 'focuslost', '*', 'highlight normal guibg=#141619' };
  };
  highlight_yank = {
    { 'textyankpost', '*', 'silent! lua vim.highlight.on_yank({ timeout = 300 })' };
  };
  match_paren_normal_mode = {
    { 'insertenter', '*', 'NoMatchParen' };
    { 'insertleave', '*', 'DoMatchParen' };
  };
  packer_user_config = {
    {'BufWritePost', 'plugins.lua', 'source <afile> | PackerSync'}
  }

  --[[
  general_colors = {
    {
      -- Hot to override colorscheme values https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
      'ColorScheme',
      '*',
      -- Change color of matching parens. Currently matches highlight color of onedark
      -- https://stackoverflow.com/a/10746829
      'highlight LineNr guifg=LightGrey guibg=#808080 | highlight MatchParen guibg=#ee88ee guifg=#23272e gui=bold'
    };
  }
  ]]--
  --[[ todo: may be unneeded

  -- Jump between matching < and > with %
  -- TODO: May be unneeded
  -- TODO: If needed - move it to settings
  -- opt.matchpairs:append('<:>')

  exclude_angle_brackets = {
    { 'filetype', 'html,typescriptreact', 'let b:delimitmate_matchpairs = "(:),[:],{:}"' };
  } ]]--
}

utils.nvim_create_augroups(autocmds)
