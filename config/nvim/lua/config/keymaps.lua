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

-- Dadbod (SQL)
vim.keymap.set("n", "<leader>db", "<CMD>DBUIToggle<CR>", { buffer = true })
-- visually select the area under the cursor and run the query
vim.keymap.set(
  "n",
  "<leader>r",
  ":normal vip<CR><PLUG>(DBUI_ExecuteQuery)",
  { buffer = true, noremap = true, silent = true, nowait = true }
)

vim.api.nvim_set_keymap("n", "<leader>ch", ":CodeCompanionChat toggle<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>ci", ":CodeCompanion<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>ci", ":<C-U>CodeCompanion<CR>", { noremap = true, silent = true })

function create_file(path)
  if path == "" then
    return
  end

  local dir = vim.fn.fnamemodify(path, ":h")
  if not vim.fn.isdirectory(dir) then
    vim.fn.mkdir(dir, "p")
  end

  local ext = ""
  if not string.match(path, "%.") then
    ext = "." .. vim.fn.expand("%:e")
  end

  vim.cmd(string.format("edit %s%s", path, ext))
end

vim.api.nvim_set_keymap(
  "n",
  "<leader>o",
  [[:lua create_file(vim.fn.input('New file path: ', vim.fn.expand("%:p:h") .. "/", "file"))<CR>]],
  { noremap = true, silent = true }
)

-- Function to toggle between implementation and spec files
function ToggleSpecImplementation()
  local current_file = vim.fn.expand("%")
  local target_file = current_file

  -- Check if current file is a spec file
  if string.match(current_file, "_spec%.rb$") then
    -- Current file is a spec, get the implementation file
    target_file = target_file:gsub("^spec/", "app/")
    target_file = target_file:gsub("_spec%.rb$", ".rb")
  else
    -- Current file is an implementation, get the spec file
    target_file = target_file:gsub("^app/", "spec/")
    target_file = target_file:gsub("%.rb$", "_spec.rb")
  end

  -- Open the target file (will create a new buffer if file doesn't exist)
  vim.cmd("edit " .. target_file)
end

-- Map the function to a key combination (e.g., <leader>s)
vim.keymap.set(
  "n",
  "<leader>h",
  ToggleSpecImplementation,
  { noremap = true, silent = true, desc = "Jump between spec and implementation" }
)

-- Copy current file path relative to current working directory
vim.keymap.set("n", "<leader>cp", function()
  local relative_path = vim.fn.expand("%:.")
  vim.fn.setreg("+", relative_path)
  vim.notify("Copied: " .. relative_path, vim.log.levels.INFO)
end, { noremap = true, silent = true, desc = "Copy relative file path" })
