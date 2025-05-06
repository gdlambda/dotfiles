local keymap = vim.keymap

local opts = { noremap = true, silent = true } 

-- Directory Navigation
keymap.set("n", "<leader>m", ":NvimTreeFocus<CR>", opts) 
keymap.set("n", "<leader>f", ":NvimTreeToggle<CR>", opts)

-- Pane Navigation
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Window Management
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts) -- Vertical
keymap.set("n", "<leader>sh", ":split<CR>", opts) -- Horizontal
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts) -- Toggle Minimum

-- Indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")


