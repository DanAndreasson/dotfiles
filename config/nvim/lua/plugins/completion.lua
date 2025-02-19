return {
  "saghen/blink.cmp",
  opts = {
    sources = {
      per_filetype = {
        codecompanion = { "codecompanion" },
      },
    },
    keymap = {
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<Tab>"] = { "accept", "fallback" },
    },
  },
}
