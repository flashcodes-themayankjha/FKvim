vim.o.mousemoveevent = true -- 🔥 Required for hover to work!

-- Smart winbar setup using a global function
_G.get_winbar = function()
  local navic_ok, navic = pcall(require, "nvim-navic")
  if navic_ok and navic.is_available() then
    return navic.get_location()
  end
  return ""
end

vim.o.winbar = "%{%v:lua.get_winbar()%}"

-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Safe require function
local function safe_require(module)
  local status, mod = pcall(require, module)
  if not status then
    vim.notify("Failed to load " .. module, vim.log.levels.ERROR)
  end
  return mod
end

-- Plugins
require("lazy").setup({

  -- UI Plugins
  { "nvim-lualine/lualine.nvim" },
  { "xiyaowong/nvim-transparent" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- Bufferline
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      safe_require("FKvim_rc.plugins.bufferline").setup()
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },
    config = function()
      local telescope = safe_require("telescope")
      local actions = safe_require("telescope.actions")
      telescope.setup({
        defaults = {
          prompt_prefix = " 🔍 ",
          selection_caret = " ",
          path_display = { "smart" },
          layout_config = {
            preview_cutoff = 120,
            horizontal = { width = 0.9 },
          },
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
          },
        },
        pickers = {
          find_files = { theme = "dropdown" },
          live_grep = { theme = "ivy" },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })
      telescope.load_extension("fzf")
    end,
  },

  -- File Explorer
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    config = function()
      safe_require("FKvim_rc.plugins.nvim_tree").setup()
    end
  },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      safe_require("FKvim_rc.plugins.terminal").setup()
    end,
  },

  -- Dashboard
  {
    "glepnir/dashboard-nvim",
    config = function()
      safe_require("FKvim_rc.plugins.fkvim_ui")
    end,
  },

  -- Git
  { "lewis6991/gitsigns.nvim" },

  -- Comments
  { "numToStr/Comment.nvim" },

  -- Syntax Highlighting
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Completion Engine
  
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
    },
  },



  -- LSP Configs
  { "neovim/nvim-lspconfig" },

  -- Winbar Breadcrumbs Plugin
  {
    "SmiteshP/nvim-navic",
    event = "LspAttach", -- optional lazy load
    config = function()
      require("nvim-navic").setup({
        highlight = true,
        separator = "  ",
        depth_limit = 5,
        icons = {
          File          = " ",
          Module        = " ",
          Namespace     = " ",
          Package       = " ",
          Class         = " ",
          Method        = " ",
          Property      = " ",
          Field         = " ",
          Constructor   = " ",
          Enum          = " ",
          Interface     = " ",
          Function      = " ",
          Variable      = " ",
          Constant      = " ",
          String        = " ",
          Number        = " ",
          Boolean       = " ",
          Array         = " ",
          Object        = " ",
          Key           = " ",
          Null          = " ",
          EnumMember    = " ",
          Struct        = " ",
          Event         = " ",
          Operator      = " ",
          TypeParameter = " ",
        },
      })
    end,
  },

  -- TypeScript Tools (replaces tsserver)
  {
    "pmizio/typescript-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
    },
    config = function()
      local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("typescript-tools").setup({
        settings = {
          separate_diagnostic_server = true,
          publish_diagnostic_on = "insert_leave",
          expose_as_code_action = "all",
          complete_function_calls = true,
          tsserver_file_preferences = {
            includeInlayParameterNameHints = "all",
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
          },
        },
        on_attach = function(client, bufnr)
          local buf_map = vim.api.nvim_buf_set_keymap
          local opts = { noremap = true, silent = true }

          buf_map(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
          buf_map(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
          buf_map(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
          buf_map(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
          buf_map(bufnr, "n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)

          local navic = require("nvim-navic")
          if client.server_capabilities.documentSymbolProvider then
            navic.attach(client, bufnr)
          end
        end,
        capabilities = lsp_capabilities,
      })
    end,
  },

})
