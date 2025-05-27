return {
  "saghen/blink.cmp",
  opts = {
    sources = {
      per_filetype = {
        codecompanion = { "codecompanion" },
      },
    },
    
    keymap = {
      preset = "default",
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<Tab>"] = { "accept", "fallback" },
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    },
  },
}
