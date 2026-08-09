vim.g.mapleader = " "      -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "," -- Same for `maplocalleader`
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { silent = true })


local keymap = vim.keymap
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<leader>w", ":wq<CR>", { desc = "Save and exit" })
keymap.set("n", "q", ":q<CR>", { desc = "Exit" })

-- half-page scrolling
keymap.set("n", "<S-j>", "<C-d>", { desc = "Scroll down half a page" })
keymap.set("n", "<S-k>", "<C-u>", { desc = "Scroll up half a page" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })     -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })   -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })      -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- window navigation
keymap.set({ "n", "t" }, "<C-h>", "<cmd>wincmd h<CR>", { desc = "Move to left window" })
keymap.set({ "n", "t" }, "<C-j>", "<cmd>wincmd j<CR>", { desc = "Move to below window" })
keymap.set({ "n", "t" }, "<C-k>", "<cmd>wincmd k<CR>", { desc = "Move to above window" })
keymap.set({ "n", "t" }, "<C-l>", "<cmd>wincmd l<CR>", { desc = "Move to right window" })
