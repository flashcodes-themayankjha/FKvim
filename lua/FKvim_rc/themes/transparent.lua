-- Setup transparency first
-- Setup transparency first
require("transparent").setup({
  extra_groups = {
    "NormalFloat", "NvimTreeNormal", "FloatBorder",
    "TelescopeNormal", "TelescopeBorder", "TelescopePromptNormal",
  },
  exclude_groups = {
    "StatusLine", "StatusLineNC", "BufferLineFill", "BufferLineBackground",
  },
})

-- Load Catppuccin with macchiato flavor
require("catppuccin").setup({
  flavour = "macchiato", -- or "mocha", "frappe", "latte"
  transparent_background = true,
  integrations = {
    lualine = false, -- Disable built-in lualine integration
    bufferline = true,
    treesitter = true,
    telescope = { enabled = true },
    cmp = true,
  },
})

vim.cmd.colorscheme("catppuccin")

-- Manually Configure Lualine
require('lualine').setup {
  options = {
    theme = 'catppuccin', -- Use Catppuccin theme for lualine
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  extensions = {'fugitive'}
}

