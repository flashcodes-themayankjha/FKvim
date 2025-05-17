local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "  -- Space as leader key

-- File actions
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)
map("n", "<leader>x", ":bd<CR>", opts)
map("n", "<leader>rr", ":source $MYVIMRC<CR>", opts)  -- Reload init.lua

-- Clipboard: Copy / Paste / Select All
map("n", "<leader>y", '"+yy', opts)                  -- Copy line to clipboard
map("n", "<leader>Y", 'ggVG"+y', opts)               -- Select all and copy
map("n", "<leader>p", '"+p', opts)                   -- Paste from clipboard
map("v", "<leader>y", '"+y', opts)                   -- Copy visual selection
map("v", "<leader>p", '"+p', opts)                   -- Paste in visual mode
map("n", "<leader>a", "ggVG", opts)                  -- Select all
map("i", "<C-v>", '<C-r>+', opts)                    -- Paste in insert mode
map("i", "<C-a>", '<Esc>ggVG"+ygi', opts)            -- Select all & copy in insert mode, return to insert
-- Pane navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)

-- Clear search highlight
map("n", "<leader>nh", ":nohl<CR>", opts)

-- Tabs
map("n", "<leader>tn", ":tabnew<CR>", opts)

-- Terminal mode: Cmd + Left = move to code, Cmd + Right = move to terminal
vim.keymap.set("t", "<D-Left>", "<C-\\><C-n><C-w>h", { desc = "To Code (Left)" })
vim.keymap.set("t", "<D-Right>", "<C-\\><C-n><C-w>l", { desc = "To Terminal (Right)" })

-- Normal mode: Cmd + Left = move to nvim-tree or code, Cmd + Right = move to terminal
vim.keymap.set("n", "<D-Left>", "<cmd>NvimTreeToggle<CR><C-w>h", { desc = "To NvimTree / Code (Left)" })
vim.keymap.set("n", "<D-Right>", "<cmd>NvimTreeToggle<CR><C-w>l", { desc = "To Terminal (Right)" })
-- Move to terminal from code space (split navigation)
vim.keymap.set("n", "<D-Right>", "<C-w>l", { desc = "Move to Terminal" })  -- Move to the right split

-- Move to code space from terminal (split navigation)
vim.keymap.set("t", "<D-Left>", "<C-\\><C-n><C-w>h", { desc = "Move to Code Space" })  -- Move to the left split (code space)

-- nvim-tree: Optionally you may want to add a keybinding to focus directly on NvimTree
vim.keymap.set("n", "<D-Left>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })

-- BufferLine navigation
map('n', '<Leader>bn', ':BufferLineCycleNext<CR>', opts)
map('n', '<Leader>bp', ':BufferLineCyclePrev<CR>', opts)
map('n', '<Leader>1', ':BufferLineGoToBuffer 1<CR>', opts)
map('n', '<Leader>2', ':BufferLineGoToBuffer 2<CR>', opts)
map('n', '<Leader>3', ':BufferLineGoToBuffer 3<CR>', opts)
map('n', '<Leader>4', ':BufferLineGoToBuffer 4<CR>', opts)
map('n', '<Leader>rc', ':BufferLinePickClose<CR>', opts)
map('n', '<Leader>bo', ':BufferLineCloseRight<CR>', opts)
map('n', '<Leader>bi', ':BufferLineCloseLeft<CR>', opts)
map('n', '<Leader>bp', ':BufferLinePick<CR>', opts)
map('n', '<Leader>bl', ':BufferLineMovePrev<CR>', opts)
map('n', '<Leader>bm', ':BufferLineMoveNext<CR>', opts)
map('n', '<Leader>bp', ':BufferLineTogglePin<CR>', opts)
map('n','<Leader>bd', '<cmd>bd<CR>', opts, { desc = "Delete Buffer" })

-- NvimTree
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>f', ':NvimTreeFindFile<CR>', opts)
map('n', '<leader>h', '<C-w>h', { desc = "Focus File Explorer" })
map('n', '<leader>l', '<C-w>l', { desc = "Focus Code Window" })

-- Telescope
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
map('n', '<leader>fb', ':Telescope buffers<CR>', opts)
map('n', '<leader>fh', ':Telescope help_tags<CR>', opts)
map('n', '<leader>fc', ':Telescope current_buffer_fuzzy_find<CR>', opts)

-- Terminal toggles
map("n", "<Space>tt", "<cmd>ToggleTerm<CR>", opts)
map("n", "<Space>th", "<cmd>ToggleTerm direction=horizontal<CR>", opts)
map("n", "<Space>tv", "<cmd>ToggleTerm direction=vertical<CR>", opts)
map("n", "<Space>tf", "<cmd>ToggleTerm direction=float<CR>", opts)

-- Close terminal from terminal mode (when focused)
map("t", "<D-w>", "<C-\\><C-n>:q<CR>", { desc = "Close Terminal" }) -- Cmd + W
-- Close window from normal mode
map("n", "<D-w>", ":q<CR>", { desc = "Close Window" }) -- Cmd + W
-- Close current terminal buffer (from terminal mode)
map("t", "<leader>tc", "<C-\\><C-n><cmd>q<CR>", { desc = "Close Terminal" }) -- Leader+tc
-- Close all toggleterm instances
map("n", "<leader>tc", "<cmd>ToggleTermToggleAll<CR>", { desc = "Toggle All Terminals" })

-- Toggle Fancy Terminal
map("n", "<leader>ta", function()
  require("toggleterm.terminal").Terminal:new({ direction = "float", hidden = true }):toggle()
end, { desc = "Toggle Fancy Terminal" })



-- Live Reload function in Lua for Neovim
function LiveReload()
  -- Run browser-sync command to start the server and watch files for changes
  vim.api.nvim_command('!browser-sync start --server --files "*.html, *.css, *.js"')
end

-- Create a key mapping to run the LiveReload function
map('n', '<leader>lr', ':lua LiveReload()<CR>', { noremap = true, silent = true })








