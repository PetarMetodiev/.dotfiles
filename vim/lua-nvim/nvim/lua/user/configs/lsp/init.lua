local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  print("Could not load lspconfig")
  return
end

require("user/configs/lsp/lsp-installer")
require("user/configs/lsp/handlers").setup()
