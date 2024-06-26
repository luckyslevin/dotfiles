-- Keymaps are autocompleteatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any addressesitional keymaps here
local map = vim.keymap.set
map("i", "jj", "<esc>")
map("i", "<c-p>", "<up>", { remap = true })
map("i", "<c-n>", "<down>", { remap = true })
map("i", "<c-b>", "<left>")
map("i", "<c-f>", "<right>")
map("i", "<c-a>", "<Esc>I")
map("i", "<c-e>", "<end>")
-- Resize window using <ctrl> arrow keys
map("n", "<a-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<a-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<a-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<a-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
