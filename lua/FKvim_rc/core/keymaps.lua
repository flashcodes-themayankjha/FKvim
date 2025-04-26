local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "  -- Space as leader key

-- File actions
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)
map("n", "<leader>x", ":bd<CR>", opts)
-- Keybinding to reload init.lua
vim.api.nvim_set_keymap('n', '<leader>rr', ':source $MYVIMRC<CR>', { noremap = true, silent = true })

-- Pane navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)

-- Clear search highlight
map("n", "<leader>nh", ":nohl<CR>", opts)

-- FKvim_rc/keymaps.lua
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', { noremap = true, silent = true })


-- Switch to next buffer
map('n', '<Leader>bn', ':BufferLineCycleNext<CR>', opts)

-- Switch to previous buffer
map('n', '<Leader>bp', ':BufferLineCyclePrev<CR>', opts)

-- Go to a specific buffer by number (e.g., <Leader>1 for buffer 1)
map('n', '<Leader>1', ':BufferLineGoToBuffer 1<CR>', opts)
map('n', '<Leader>2', ':BufferLineGoToBuffer 2<CR>', opts)
map('n', '<Leader>3', ':BufferLineGoToBuffer 3<CR>', opts)
map('n', '<Leader>4', ':BufferLineGoToBuffer 4<CR>', opts)

-- Close the current buffer
map('n', '<Leader>rc', ':BufferLinePickClose<CR>', opts)

-- Pick and close any buffer
map('n', '<Leader>bp', ':BufferLinePick<CR>', opts)

-- Pin the current buffer (Keep it fixed)
map('n', '<Leader>bp', ':BufferLineTogglePin<CR>', opts)

-- Move the current buffer to the next
map('n', '<Leader>bm', ':BufferLineMoveNext<CR>', opts)

-- Move the current buffer to the previous
map('n', '<Leader>bl', ':BufferLineMovePrev<CR>', opts)



-- Reload init.lua configuration
map('n', '<Leader>rr', ':source $MYVIMRC<CR>', opts)


local keymap = vim.keymap.set

-- NvimTree Keybindings
keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })  -- Open/close NvimTree
keymap('n', '<leader>f', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })  -- Find current file in NvimTree
-- Navigate to nvim-tree
keymap("n", "<leader>h", "<C-w>h", { desc = "Focus File Explorer" })

-- Navigate to main file workspace
keymap("n", "<leader>l", "<C-w>l", { desc = "Focus Code Window" })


-- Bufferline Keybindings
keymap('n', '<leader>bh', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })  -- Move to previous buffer
keymap('n', '<leader>bl', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })  -- Move to next buffer
keymap('n', '<leader>bc', ':BufferLinePickClose<CR>', { noremap = true, silent = true })  -- Close current buffer using BufferLine
keymap('n', '<leader>bo', ':BufferLineCloseRight<CR>', { noremap = true, silent = true })  -- Close buffers to the right
keymap('n', '<leader>bi', ':BufferLineCloseLeft<CR>', { noremap = true, silent = true })  -- Close buffers to the left




keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })      -- Find files
keymap('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })       -- Grep in project
keymap('n', '<leader>fb', ':Telescope buffers<CR>', { noremap = true, silent = true })         -- List buffers
keymap('n', '<leader>fh', ':Telescope help_tags<CR>', { noremap = true, silent = true })       -- Help
keymap('n', '<leader>fc', ':Telescope current_buffer_fuzzy_find<CR>', { noremap = true, silent = true }) -- Find in current buffer



-- Set keybindings for terminal splits using Lua API
keymap("n", "<Space>tt", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })
keymap("n", "<Space>th", "<cmd>ToggleTerm direction=horizontal<CR>", { noremap = true, silent = true })
keymap("n", "<Space>tv", "<cmd>ToggleTerm direction=vertical<CR>", { noremap = true, silent = true })
keymap("n", "<Space>tf", "<cmd>ToggleTerm direction=float<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>ta", function()
  require("toggleterm.terminal").Terminal
    :new({ direction = "float", hidden = true }):toggle()
end, { desc = "Toggle Fancy Terminal" })

