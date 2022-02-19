local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  print("Could not load lspconfig")
  return
end
print('Add auto LSP installation') -- https://github.com/williamboman/nvim-lsp-installer/wiki/Advanced-Configuration
require("user/configs/lsp/lsp-installer")
require("user/configs/lsp/handlers").setup()
