return {
  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Use latest stable version
    ft = { "rust" },
    config = function()
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(client, bufnr)
            -- Set your keymaps here if needed
            local opts = { buffer = bufnr }
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

           require("inlay-hints").on_attach(client, bufnr)
          end,
           capabilities = require('blink.cmp').get_lsp_capabilities(),
          default_settings = {
            ["rust-analyzer"] = {
              checkOnSave = {
                command = "clippy",
              },
              cargo = {
                allFeatures = true,
                unstableFeatures = true,
              },
              diagnostics = {
                enable = true,
                disabled = { "unresolved-proc-macro" },
                enableExperimental = true,
              },
              inlayHints = {
                auto = true,
                only_current_line = false,
                -- enable = true,
                typeHints = true,
                parameterHints = true,
                chainingHints = true,
                -- maxLength = 80,  -- Adjust maximum length for hints (this can help prevent wrapping issues)
             },
            },
          },
        },
      }

      -- Optional: Disable rustfmt_autosave if you prefer manual formatting
      vim.g.rustfmt_autosave = 0
        vim.api.nvim_create_autocmd("BufWritePost", {
          pattern = "*.rs",
          callback = function()
            vim.cmd("silent !cargo fmt")
            -- Optional: reload the buffer to see changes
            vim.cmd("edit")
          end,
        })
    end,
  },
}

