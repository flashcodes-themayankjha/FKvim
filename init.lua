--Starting Point of the Program FKvim 

if vim.fn.has("unix") == 1 then
  vim.env.TERM_PROGRAM = "Alacritty"
  vim.env.TERM = "xterm-256color"
end


vim.opt.rtp:append(vim.fn.stdpath("config"))

require("FKvim_rc.core")

-- ~/.config/nvim/init.lua
--
-- 
