local lspconfig = require("lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "tsserver", "html", "cssls", "jsonls", "pyright", "jdtls", "kotlin_language_server", "lua_ls"
  },
})

require("mason-lspconfig").setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = lsp_capabilities,
      on_attach = function(client, bufnr)
        local navic = require("nvim-navic")
        if client.server_capabilities.documentSymbolProvider then
          navic.attach(client, bufnr)
        end

        local opts = { noremap = true, silent = true }
        local map = vim.api.nvim_buf_set_keymap
        map(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
        map(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
        map(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
        map(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
        map(bufnr, "n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
      end,
    })
  end
})
