return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Ensure Ruby is in the list of installed parsers if not already
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "ruby", "graphql" })
      end

      -- Register the custom query for Ruby
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "ruby",
        callback = function()
          vim.treesitter.query.set(
            "ruby",
            "injections",
            [[
              (heredoc_body
                (heredoc_content) @injection.content
                (heredoc_end) @gql_tag (#eq? @gql_tag "GQL")
                (#set! injection.include-children)
                (#set! injection.combined)
                (#set! injection.language "graphql")
              )
            ]]
          )
        end,
      })

      -- Register the custom query for JS/TS files
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
        callback = function()
          local ft = vim.bo.filetype
          local lang = ft

          -- Map filetypes to treesitter parser names
          if ft == "javascriptreact" then
            lang = "jsx"
          elseif ft == "typescriptreact" then
            lang = "tsx"
          elseif ft == "javascript" then
            lang = "javascript"
          elseif ft == "typescript" then
            lang = "typescript"
          end

          vim.treesitter.query.set(
            lang,
            "injections",
            [[
              (call_expression
                function: (identifier) @name (#eq? @name "gql")
                arguments: (arguments
                  (template_string 
                    (string_fragment) @injection.content)
                    (#set! injection.include-children)
                    (#set! injection.combined)
                    (#set! injection.language "graphql")
                  )
                )

              (call_expression 
                function: (member_expression 
                  object: (identifier) 
                  property: (property_identifier) @name (#eq? @name "prepareBackend"))
                arguments: (arguments 
                  (template_string) @injection.content
                  (#offset! @injection.content 0 1 0 -1)
                  (#set! injection.include-children)
                  (#set! injection.combined)
                  (#set! injection.language "ruby")))
            ]]
          )
        end,
      })

      -- Disable incremental selection keymaps
      opts.incremental_selection = {
        enable = false,
      }

      return opts
    end,
  },
}
