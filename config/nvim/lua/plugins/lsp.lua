return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    -- Global LSP settings
    diagnostics = {
      virtual_text = false,
    },
    inlay_hints = {
      enabled = false,
    },
    -- Server configurations
    ---@type lspconfig.options
    servers = {
      -- Ruby LSP configuration
      ruby_lsp = {
        init_options = {
          addonSettings = {
            ["Ruby LSP Rails"] = {
              enablePendingMigrationsPrompt = false,
            },
          },
        },
      },
    },
  },
}
