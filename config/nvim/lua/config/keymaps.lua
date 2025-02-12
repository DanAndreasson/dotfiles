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

vim.keymap.set(
  "n",
  "<leader>j",
  vim.diagnostic.goto_next,
  { silent = true, desc = "Go to next diagnostic", nowait = true }
)
vim.keymap.set(
  "n",
  "<leader>k",
  vim.diagnostic.goto_prev,
  { silent = true, desc = "Go to previous diagnostic", nowait = true }
)
vim.keymap.set("n", "gp", vim.lsp.buf.implementation, { silent = true, desc = "Go to implementation", nowait = true })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { silent = true, desc = "Go to definition", nowait = true })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { silent = true, desc = "List references", nowait = true })
vim.keymap.set("n", "gl", vim.lsp.buf.code_action, { silent = true, desc = "Code Action", nowait = true })
