return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  ---@module "conform"
  opts = function(_, opts)
    -- Merge your original formatter configuration
    opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft or {}, {
      lua = { "stylua" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      ruby = { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      css = { "prettierd", "prettier", stop_after_first = true },
      html = { "prettierd", "prettier", stop_after_first = true },
      json = { "prettierd", "prettier", stop_after_first = true },
      yaml = { "prettierd", "prettier", stop_after_first = true },
      markdown = { "prettierd", "prettier", stop_after_first = true },
      graphql = { "prettierd", "prettier", stop_after_first = true },
    })

    opts.default_format_opts = vim.tbl_deep_extend("force", opts.default_format_opts or {}, {
      lsp_format = "fallback",
    })

    -- SQL formatting configuration
    opts.formatters = opts.formatters or {}
    opts.formatters.sqlfluff = {
      args = { "format", "--dialect=ansi", "-" },
    }

    -- Define which filetypes should use sqlfluff
    local sql_filetypes = { "sql" } -- add more filetypes if needed

    for _, ft in ipairs(sql_filetypes) do
      opts.formatters_by_ft[ft] = opts.formatters_by_ft[ft] or {}
      table.insert(opts.formatters_by_ft[ft], "sqlfluff")
    end

    return opts
  end,
}
