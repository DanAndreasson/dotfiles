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
      -- TODO
      -- Add the new keybinding for branch TODOs
      {
        "<leader>T",
        function()
          require("telescope.builtin").live_grep({
            prompt_title = "TODOs in current branch only",
            additional_args = function()
              return {
                "-e",
                "TODO|FIXME",
                "--",
                "$(git diff --name-only master...HEAD)",
              }
            end,
          })
        end,
        desc = "Find TODOs in current branch",
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
    -- Add the custom command
    config = function(_, opts)
      require("telescope").setup(opts)

      -- Register the custom command
      vim.api.nvim_create_user_command("TodosInBranch", function()
        require("telescope.builtin").live_grep({
          prompt_title = "TODOs in current branch only",
          additional_args = function()
            return {
              "-e",
              "TODO|FIXME",
              "--",
              "$(git diff --name-only master...HEAD)",
            }
          end,
        })
      end, { desc = "Find TODOs only in the current branch" })
    end,
  },
}
