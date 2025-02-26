return {
  {
    "mfussenegger/nvim-lint",
    config = function()
      -- Associate the 'sqlfluff' linter with SQL filetypes.
      require("lint").linters_by_ft = {
        sql = { "sqlfluff" },
      }

      -- Optionally, lint on file save and text changes.
      vim.api.nvim_create_autocmd({ "BufWritePost", "TextChanged" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })

      vim.api.nvim_create_autocmd("BufEnter", {
        callback = function()
          if vim.bo.filetype == "sql" then
            require("lint").try_lint()
          end
        end,
      })
    end,
  },
}
