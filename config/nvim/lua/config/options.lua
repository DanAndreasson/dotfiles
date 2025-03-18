-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.opt.smoothscroll = false
vim.opt.cursorline = false
vim.opt.laststatus = 2 -- Each split should have its own statusline

vim.g.snacks_animate = false
vim.g.lazyvim_picker = "telescope"
vim.g["test#strategy"] = "vimux"

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "VimResized" }, {
  pattern = "*",
  command = "wa",
})

vim.opt.foldenable = false
vim.opt.foldmethod = "manual"

-- Don't automatically indent when moving multiple lines. Let formatters handle it
vim.g.move_auto_indent = 0
