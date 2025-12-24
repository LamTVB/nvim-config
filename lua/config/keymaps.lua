-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.del("n", "<leader>fF")
vim.keymap.del("v", "s")
vim.keymap.del("n", "s")
vim.keymap.set({ "n", "v" }, " ", "<PageDown>", { noremap = true, silent = true })
vim.keymap.set("n", "-", "<PageUp>", { noremap = true, silent = true })

-- Copy pase without overwriting the default register
vim.keymap.set("x", "p", function()
  return "pgv\"" .. vim.v.register .. "y`>"
end, { expr = true, noremap = true, silent = true })

vim.keymap.set("v", "p", function()
  return "pgv\"" .. vim.v.register .. "y`>"
end, { expr = true, noremap = true, silent = true })
