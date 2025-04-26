local M = {}

function M.setup()
  require("bufferline").setup({
    options = {
      mode = "buffers",
      style_preset = require("bufferline").style_preset.default,
      numbers = "none",
      indicator = {
        style = "icon",
        icon = "▎",
      },
      modified_icon = "●",
      close_icon = "",
      buffer_close_icon = "",
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(_, _, diagnostics_dict, _)
        local s = ""
        for e, n in pairs(diagnostics_dict) do
          local sym = e == "error" and " " or (e == "warning" and " " or " ")
          s = s .. sym .. n .. " "
        end
        return s
      end,
      separator_style = "slant",
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center",
          separator = true,
        },
      },
      show_buffer_close_icons = true,
      show_close_icon = true,
      color_icons = true,
      always_show_bufferline = true,

      -- 🔁 Hover Settings
      hover = {
        enabled = true,
        delay = 200,
        reveal = { "close" },  -- shows close icon only on hover
      },

      -- 🧩 Grouping Support (optional)
      groups = {
        items = {
          require("bufferline.groups").builtin.pinned:with({ icon = "" }),
          require("bufferline.groups").builtin.ungrouped,
        },
      },
    },

    highlights = {
      fill = {
        bg = "NONE",
      },
      background = {
        fg = "#888888",
        bg = "NONE",
      },
      buffer_selected = {
        fg = "#A6E22E",
        bg = "NONE",
        underline = false,  -- ✅ underlines current tab
      },
      buffer_visible = {
        fg = "#cccccc",
        bg = "NONE",
      },
      modified = {
        fg = "#f7768e",
        bg = "NONE",
      },
      modified_selected = {
        fg = "#f7768e",
        bg = "NONE",
      },
      separator = {
        fg = "#44475a",
        bg = "NONE",
      },
      separator_selected = {
        fg = "#bd93f9",
        bg = "NONE",
      },
      indicator_selected = {
        fg = "#50fa7b",
        bg = "NONE",
      },
    },
  })
end

return M
