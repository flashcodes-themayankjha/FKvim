-- File: lua/FKvim_rc/plugins/terminal.lua

local M = {}

function M.setup()
  require("toggleterm").setup({
    size = 20,
    open_mapping = [[<leader>tt]],
    direction = "horizontal",
    float_opts = {
      border = "rounded",
      winblend = 10, -- Lower = more opaque, Higher = more transparent
    },
    shade_terminals = false,
    insert_mappings = true,
    close_on_exit = true,
    shell = vim.o.shell,
  })

  -- Set highlight groups for transparency and neon border
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
  vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#ff79c6", bg = "NONE" }) -- neon pink border
end

return M
