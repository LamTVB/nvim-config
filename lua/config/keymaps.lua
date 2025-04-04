-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.del("n", "<leader>fF")
vim.keymap.del("v", "s")
vim.keymap.del("n", "s")
vim.keymap.set("n", " ", '<PageDown>', { noremap = true, silent = true })
vim.keymap.set("n", "-", '<PageUp>', { noremap = true, silent = true })
