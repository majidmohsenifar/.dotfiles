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

      -- Optional: run `cargo fmt` on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.rs",
        callback = function()
          if vim.fn.findfile("Cargo.toml", ".;") == "" then return end
          local view = vim.fn.winsaveview()
          vim.fn.jobstart({ "cargo", "fmt" }, {
            stdout_buffered = true,
            on_exit = function()
              vim.schedule(function()
                vim.cmd("silent! e!")
                vim.fn.winrestview(view)
              end)
            end,
          })
        end,
      })
    end,
  },
}

