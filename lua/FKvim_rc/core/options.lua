local opt = vim.opt

-- General
opt.number = true            -- show line numbers
opt.relativenumber = true    -- relative line numbers
opt.mouse = 'a'              -- enable mouse
opt.clipboard = 'unnamedplus'-- use system clipboard
opt.termguicolors = true     -- true color support
opt.cursorline = true        -- highlight current line
opt.signcolumn = "yes"       -- always show sign column

-- Tabs & Indentation
opt.expandtab = true         -- convert tabs to spaces
opt.shiftwidth = 2           -- spaces per indent
opt.tabstop = 2              -- spaces per tab
opt.smartindent = true       -- smart autoindent

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- UI
opt.splitbelow = true
opt.splitright = true
opt.scrolloff = 8
opt.wrap = false

-- General Settings  and Winbar settings 

vim.o.mousemoveevent = true
vim.o.winbar = "%{%v:lua.get_winbar()%}"

-- Breadcrumb Winbar
_G.get_winbar = function()
  local ok, navic = pcall(require, "nvim-navic")
  if ok and navic.is_available() then
    return navic.get_location()
  end
  return ""
end

