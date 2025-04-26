-- File: lua/FKvim_rc/lsp/handlers.lua

local M = {}

M.on_attach = function(client, bufnr)
  -- Example of setting up LSP key mappings
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

return M

