return {
  {
    "mrcjkb/rustaceanvim",
    version = "^6", -- Use latest stable version
    lazy = false,
    ft = { "rust" },
    config = function()
      vim.g.rustaceanvim = {
        server = {
          cmd = { "/home/majid/.rustup/toolchains/1.89-x86_64-unknown-linux-gnu/bin/rust-analyzer" },  -- Explicit path
          on_attach = function(client, bufnr)
            -- Set your keymaps here if needed
            local opts = { buffer = bufnr }
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)

           require("inlay-hints").on_attach(client, bufnr)
          end,
           capabilities = require('blink.cmp').get_lsp_capabilities(),
          default_settings = {
            ["rust-analyzer"] = {
               files = {
                excludeDirs = { "target", "node_modules" },
               },
              check = {
                command = "clippy",
              },
              checkOnSave = true,
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
                typeHints = true,
                parameterHints = true,
                chainingHints = true,
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
          end,
        })
    end,
  },
}

