local M = {}

M.setup = function()
  require("nvim-tree").setup({
    view = {
      width = 35,
      side = "left",
      number = false,
      relativenumber = false,
      signcolumn = "yes",
      preserve_window_proportions = true,
    },

    renderer = {
      root_folder_label = false,
      highlight_git = true,
      highlight_opened_files = "name",
      group_empty = true,
      indent_markers = {
        enable = true,
        inline_arrows = true,
      },
      icons = {
        webdev_colors = true,
        glyphs = {
          default = "󰈙",
          symlink = "",
          folder = {
            arrow_closed = "󱞫",
            arrow_open = "󱞩",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
          },
          git = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "★",
            deleted = "",
            ignored = "◌",
          },
        },
      },
    },

    filters = {
      dotfiles = true,
      custom = { ".git", "node_modules", ".cache" },
    },

    git = {
      enable = true,
      ignore = false,
    },

    diagnostics = {
      enable = true,
      show_on_dirs = true,
      show_on_open_dirs = false,
      debounce_delay = 50,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },

    update_focused_file = {
      enable = true,
      update_root = true,
    },

    actions = {
      open_file = {
        quit_on_open = false,
        resize_window = true,
      },
    },
  })
end

return M
