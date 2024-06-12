-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
map("i", "jj", "<esc>")
map("i", "<c-p>", "<up>")
map("i", "<c-n>", "<down>")
map("i", "<c-b>", "<left>")
map("i", "<c-f>", "<right>")
map("i", "<c-a>", "<Esc>I")
map("i", "<c-e>", "<end>")
map("i", "<c-d>", "<delete>")
map("i", "<c-h>", "<bs>")
