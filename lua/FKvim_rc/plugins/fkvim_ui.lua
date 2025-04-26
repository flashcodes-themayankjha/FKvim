local db = require("dashboard")

-- Hacker quotes
local hacker_quotes = {
  "💀 Hack the planet!",
  "👾 Code is poetry. FKvim is the pen.",
  "🔮 Vim isn’t just a tool. It’s a lifestyle.",
  "🚀 Run FKvim like you own the matrix.",
  "🧠 Every keystroke counts. Master your editor.",
}
math.randomseed(os.time())
local footer_quote = hacker_quotes[math.random(#hacker_quotes)]

-- Setup with padding and center alignment
db.setup({
  theme = "doom",
  config = {
    header = {
      "",
      "",
      "",
      "███████╗██╗  ██╗██╗   ██╗ ██╗ ███╗   ███╗",
      "██╔════╝██║  ██║╚██╗ ██╔╝ ██║ ████╗ ████║",
      "█████╗  ███████║ ╚████╔╝  ██║ ██╔████╔██║",
      "██╔══╝  ██╔══██║  ╚██╔╝   ██║ ██║╚██╔╝██║",
      "██║     ██║  ██║          ██║ ██║ ╚═╝ ██║",
      "╚═╝     ╚═╝  ╚═╝          ╚═╝ ╚═╝     ╚═╝",
      "           🚀  FKvim  🚀           ",
      "",
      "",
    },

    center = {
      {
        icon = "  ",
        icon_hl = "DashboardIcon",
        desc = "New File",
        desc_hl = "DashboardDesc",
        action = "enew",
        key = "n",
        key_hl = "DashboardKey",
      },
      {
        icon = "󰈞  ",
        icon_hl = "DashboardIcon",
        desc = "Find Files",
        desc_hl = "DashboardDesc",
        action = "Telescope find_files",
        key = "f",
        key_hl = "DashboardKey",
      },
      {
        icon = "  ",
        icon_hl = "DashboardIcon",
        desc = "Projects",
        desc_hl = "DashboardDesc",
        action = "Telescope projects",
        key = "p",
        key_hl = "DashboardKey",
      },
      {
        icon = "  ",
        icon_hl = "DashboardIcon",
        desc = "Terminal (float)",
        desc_hl = "DashboardDesc",
        action = "ToggleTerm direction=float",
        key = "t",
        key_hl = "DashboardKey",
      },
      {
        icon = "  ",
        icon_hl = "DashboardIcon",
        desc = "Edit Config",
        desc_hl = "DashboardDesc",
        action = "edit ~/.config/nvim/init.lua",
        key = "c",
        key_hl = "DashboardKey",
      },
      {
        icon = "󰿅  ",
        icon_hl = "DashboardIcon",
        desc = "Exit",
        desc_hl = "DashboardDesc",
        action = "qa",
        key = "q",
        key_hl = "DashboardKey",
      },
    },

    footer = {
      "",
      "🦾 Designed for speed. Crafted for coders.",
      "🌐 Welcome to FKvim — NeoVim, Unleashed.",
      "💬 " .. footer_quote,
      "",
      "👨‍💻 Developed by Mayank Kumar Jha",
      "",
      "",
    }
  }
})


vim.cmd([[
  augroup CenterDashboard
    autocmd!
    autocmd FileType dashboard setlocal winwidth=80
  augroup END
]])