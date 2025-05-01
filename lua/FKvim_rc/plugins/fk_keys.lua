local M = {}

function M.setup()
  local wk = require("which-key")
  wk.setup()

  wk.register({
    -- File Operations
    { "<leader>f", group = "file" },
    ["<leader>f"] = {
      name = "+file",
      f = { "<cmd>Telescope find_files<CR>", "Find Files" },
      g = { "<cmd>Telescope live_grep<CR>", "Live Grep" },
      r = { "<cmd>Telescope oldfiles<CR>", "Recent Files" },
      n = { "<cmd>enew<CR>", "New File" },
    },

    -- Buffer Operations
    { "<leader>b", group = "buffer" },
    ["<leader>b"] = {
      name = "+buffer",
      b = { "<cmd>Telescope buffers<CR>", "List Buffers" },
      d = { "<cmd>bd<CR>", "Delete Buffer" },
      n = { "<cmd>bnext<CR>", "Next Buffer" },
      p = { "<cmd>bprevious<CR>", "Previous Buffer" },
    },

    -- Tab and Terminal
    { "<leader>t", group = "tab/term" },
    ["<leader>t"] = {
      name = "+tab/term",
      t = { "<cmd>tabnew<CR>", "New Tab" },
      x = { "<cmd>split | terminal<CR>", "Horizontal Terminal" },
      v = { "<cmd>vsplit | terminal<CR>", "Vertical Terminal" },
    },

    -- Reload Config
    { "<leader>r", group = "reload" },
    ["<leader>r"] = {
      name = "+reload",
      r = { "<cmd>source %<CR>", "Reload File" },
      c = { "<cmd>PackerCompile<CR>", "Compile Plugins" },
    },

    -- Clear Highlight
    { "<leader>n", group = "nohl" },
    ["<leader>n"] = {
      name = "+nohl",
      n = { "<cmd>nohlsearch<CR>", "Clear Highlight" },
    },

    -- File Explorer
    { "<leader>e", group = "explorer" },
    ["<leader>e"] = {
      name = "+explorer",
      e = { "<cmd>NvimTreeToggle<CR>", "Toggle Explorer" },
    },

    -- Yank/Copy
    { "<leader>y", group = "yank/copy" },
    ["<leader>y"] = {
      name = "+yank/copy",
      y = { '"+yy', "Yank Line" },
      p = { '"+p', "Paste" },
    },

    -- Emmet Expansion
    { "<leader>e", group = "Emmet" },
    ["<leader>e"] = {
      name = "+Emmet",
      e = { "<cmd>EmmetExpandAbbr<CR>", "Expand Emmet Abbreviation" },
    },
  })
end

return M
