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

  -- keymapping directory 
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("FKvim_rc.plugins.fk_keys").setup()
    end
  },

  -- Indent
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("FKvim_rc.plugins.fk_indents").setup()
    end 
  },

  -- Emmet 
  {
    "mattn/emmet-vim",
    ft = { "html", "css", "javascriptreact", "typescriptreact" },
    init = function()
      vim.g.user_emmet_leader_key = "<C-e>" -- or set to your preference
    end
  },

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

  -- Syntax Highlighting + Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "html", "javascript", "typescript", "tsx", "css", "lua" 
        },
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true }, -- Enable autotag
      })
    end
  },

  -- Surround plugin
  {
    "kylechui/nvim-surround",
    version = "*", -- Stable
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end
  },

  -- Breadcrumbs (winbar) Plugin: nvim-navic
  {
    "SmiteshP/nvim-navic",
    event = "LspAttach", -- lazy load on LSP attach
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

  -- LSP Config with navic on_attach integration
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')
      local navic = require("nvim-navic")

      local on_attach = function(client, bufnr)
        if client.server_capabilities.documentSymbolProvider then
          navic.attach(client, bufnr)
        end
      end

      lspconfig.pyright.setup{
        on_attach = on_attach,
      }

      lspconfig.tsserver.setup{
        on_attach = on_attach,
      }

      -- add more servers here with on_attach if needed
    end,
  },

  -- Autocompletion setup (nvim-cmp + LuaSnip)
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = {
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'luasnip' },
        },
      })
    end
  },

  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("FKvim_rc.plugins.fk_pair").setup()
    end,
  },

  -- Treesitter autotag plugin
  {
    "windwp/nvim-ts-autotag",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

})

