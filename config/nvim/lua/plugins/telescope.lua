return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-live-grep-args.nvim", -- Add the live_grep_args plugin
    },
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
          require("telescope").extensions.live_grep_args.live_grep_args()
        end,
        desc = "Live Grep with Args",
        nowait = true,
      },
      {
        "<leader>Tb",
        function()
          -- Get the list of modified files in the current branch
          local git_files =
            vim.fn.systemlist("git diff --name-only master...HEAD | xargs grep -lE 'TODO|FIXME' || true")

          if vim.v.shell_error ~= 0 or #git_files == 0 then
            print("No modified files containing TODOs")
            return
          end

          -- Show only files, allowing filtering by filename
          require("telescope.builtin").find_files({
            prompt_title = "Files with TODOs (Current Branch)",
            find_command = { "echo", table.concat(git_files, "\n") },
          })
        end,
        desc = "Find files with TODOs in current branch",
        nowait = true,
      },
      {
        "<leader>Ta",
        function()
          -- Get the list of all tracked files with TODOs
          local all_todo_files = vim.fn.systemlist("git ls-files | xargs grep -lE 'TODO|FIXME' || true")

          if vim.v.shell_error ~= 0 or #all_todo_files == 0 then
            print("No TODOs found in repository")
            return
          end

          -- Show only files, allowing filtering by filename
          require("telescope.builtin").find_files({
            prompt_title = "Files with TODOs (Entire Repo)",
            find_command = { "echo", table.concat(all_todo_files, "\n") },
          })
        end,
        desc = "Find files with TODOs across the repo",
        nowait = true,
      },
      {
        "<leader>sw",
        function()
          require("telescope-live-grep-args.shortcuts").grep_visual_selection()
        end,
        desc = "Live Grep for word under cursor",
        mode = "n",
        nowait = true,
      },
    },
    opts = function(_, opts)
      local actions = require("telescope.actions")
      local lga_actions = require("telescope-live-grep-args.actions")

      -- Ensure we keep existing mappings
      opts.defaults = opts.defaults or {}
      opts.defaults.mappings = opts.defaults.mappings or {}

      opts.defaults.mappings.i = vim.tbl_deep_extend("force", opts.defaults.mappings.i or {}, {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<esc>"] = actions.close,
        ["<C-l>"] = lga_actions.quote_prompt(), -- Example: Auto-quote the search term
      })

      opts.defaults.mappings.n = vim.tbl_deep_extend("force", opts.defaults.mappings.n or {}, {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
      })

      -- Ensure we keep existing extensions and add live_grep_args
      opts.extensions = opts.extensions or {}
      opts.extensions.live_grep_args = {
        auto_quoting = true, -- Automatically add quotes around words
      }

      -- Load the new extension
      require("telescope").load_extension("live_grep_args")
    end,
  },
}
