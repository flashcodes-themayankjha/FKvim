-- ~/.config/nvim/lua/FKvim/plugins/FK_indent.lua

local M = {}

function M.setup()
  local hooks = require("ibl.hooks")

  -- Define Capucine-style indent highlight groups
  vim.api.nvim_set_hl(0, "IndentLevel1", { fg = "#4b3a35", nocombine = true })
  vim.api.nvim_set_hl(0, "IndentLevel2", { fg = "#7c5e57", nocombine = true })
  vim.api.nvim_set_hl(0, "IndentLevel3", { fg = "#a7867c", nocombine = true })
  vim.api.nvim_set_hl(0, "IndentLevel4", { fg = "#cfaea2", nocombine = true })

  hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "IblIndent", {})
  end)

  require("ibl").setup {
    indent = {
      char = "│",
      highlight = {
        "IndentLevel1",
        "IndentLevel2",
        "IndentLevel3",
        "IndentLevel4",
      },
    },
    scope = {
      enabled = true,
      show_start = true,
      show_end = false,
      highlight = {
        "IndentLevel1",
        "IndentLevel2",
        "IndentLevel3",
        "IndentLevel4",
      },
    },
    exclude = {
      filetypes = { "help", "dashboard", "lazy", "NvimTree", "terminal" },
      buftypes = { "terminal" },
    },
    whitespace = {
      remove_blankline_trail = true,
    },
  }
end

return M

