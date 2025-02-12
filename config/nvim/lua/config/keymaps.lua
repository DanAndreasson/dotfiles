-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Jump back and forth between the last two files
vim.keymap.set("n", "<leader><leader>", "<c-^>", { silent = true, nowait = true })

-- Vimux
vim.keymap.set("n", "<leader>n", ":TestNearest<CR>", { silent = true, nowait = true })
vim.keymap.set("n", "<leader>f", ":TestFile<CR>", { silent = true, nowait = true })
vim.keymap.set("n", "<leader>a", ":TestSuite<CR>", { silent = true, nowait = true })
vim.keymap.set("n", "<leader>l", ":TestLast<CR>", { silent = true, nowait = true })
