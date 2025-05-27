return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    opts.diagnostics.virtual_text = false

    -- Add Ruby LSP configuration
    opts.servers = opts.servers or {}
    opts.servers.ruby_lsp = {
      init_options = {
        addonSettings = {
          ["Ruby LSP Rails"] = {
            enablePendingMigrationsPrompt = false,
          },
        },
      },
    }
  end,
}
