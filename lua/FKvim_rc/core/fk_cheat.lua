local M = {}

-- Function to open the cheatsheet file in a floating window
function M.open_cheatsheet()
  -- Use a relative path to the cheatsheet file
  local cheatsheet_path = vim.fn.stdpath('config') .. '/lua/FKvim_rc/core/fk_cheat/cheatsheet.txt'

  -- Check if the file exists
  if vim.fn.filereadable(cheatsheet_path) == 1 then
    -- Open file in a new floating window with the specified width and height
    vim.cmd("split")
    vim.cmd("term cat " .. cheatsheet_path)

    -- Close terminal with escape key
    vim.api.nvim_buf_set_keymap(0, 't', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })
  else
    print("Cheatsheet file not found!")
  end
end

-- Register the keybinding to open the cheatsheet in normal mode
function M.setup_keybindings()
  local map = vim.keymap.set
  local opts = { noremap = true, silent = true }

  -- Binding to open cheatsheet
  map("n", "<leader>cf", function() M.open_cheatsheet() end, opts)
end

-- Initialize setup
function M.setup()
  M.setup_keybindings()
end

return M

