local M = {}

function M.setup()
  local autopairs = require("nvim-autopairs")

  autopairs.setup({
    check_ts = true, -- enables treesitter integration
    disable_filetype = { "TelescopePrompt", "vim" },
    fast_wrap = {},
  })

  -- Optional: integrate with nvim-cmp if present
  local cmp_ok, cmp = pcall(require, "cmp")
  if cmp_ok then
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end
end

return M

