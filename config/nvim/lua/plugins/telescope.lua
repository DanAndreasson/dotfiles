return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<C-p>",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Find Files",
        nowait = true,
      },
      {
        "<leader>s",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Live Grep",
        nowait = true,
      },
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<esc>"] = require("telescope.actions").close,
          },
          n = {
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
            ["<C-j>"] = require("telescope.actions").move_selection_next,
          },
        },
      },
    },
  },
}
