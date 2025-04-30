-- Enable mouse support
vim.opt.mouse = "a"

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Better yank/paste with mouse or OS shortcuts
vim.opt.paste = false

require("FKvim_rc.core.options")
require("FKvim_rc.core.keymaps")
require("FKvim_rc.core.autocmd")
require("FKvim_rc.plugins")  -- this loads plugins/init.lua
require("FKvim_rc.themes")


