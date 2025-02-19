local sql_ft = { "sql", "mysql", "plsql" }

return {
  {
    "nvim-treesitter",
    opts = { ensure_installed = { "sql" } },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      for _, ft in ipairs(sql_ft) do
        opts.linters_by_ft[ft] = opts.linters_by_ft[ft] or {}
        table.insert(opts.linters_by_ft[ft], "sqlfluff")
      end
    end,
  },
}
