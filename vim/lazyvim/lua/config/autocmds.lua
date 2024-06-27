-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("user_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup("comments"),
  command = "set formatoptions-=o",
})

vim.api.nvim_create_autocmd({ "VimEnter", "WinEnter", "BufWinEnter" }, {
  group = augroup("enable_cursorline"),
  command = "setlocal cursorline",
})

vim.api.nvim_create_autocmd("WinLeave", {
  group = augroup("disable_cursorline"),
  command = "setlocal nocursorline",
})
