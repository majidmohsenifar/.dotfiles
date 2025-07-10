return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lspconfig = require("lspconfig")

        local sign = function(opts)
          vim.fn.sign_define(opts.name, {
            texthl = opts.name,
            text = opts.text,
            numhl = nil, -- nil instead of ""
          })
        end

        vim.diagnostic.config({
          signs = {
            text = {
              [vim.diagnostic.severity.ERROR] = "E",
              [vim.diagnostic.severity.WARN]  = "W",
              [vim.diagnostic.severity.INFO]  = "I",
              [vim.diagnostic.severity.HINT]  = "H",
            },
          },
        })

      -- Enable sign column
      vim.cmd("set signcolumn=yes")

      -- Show diagnostics in float on CursorHold
      vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
          vim.diagnostic.open_float(nil, { focusable = false })
        end,
      })

      -- Optional: Define on_attach if needed
      -- local on_attach = function(client, bufnr)
      --   -- Example: Inlay hints for Neovim 0.10+
      --   if vim.lsp.inlay_hint then
      --     vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      --   end
      -- end

      -- gopls setup
      lspconfig.gopls.setup({
        cmd = { "gopls" },
        filetypes = { "go", "gomod" },
        -- on_attach = on_attach,
        capabilities = require('blink.cmp').get_lsp_capabilities(),
        settings = {
          gopls = {
            buildFlags = { "-tags", "wireinject" },
            experimentalPostfixCompletions = true,
            analyses = {
              unusedparams = true,
              shadow = true,
              fillstruct = true,
            },
            staticcheck = true,
          },
        },
        init_options = {
          usePlaceholders = true,
        },
      })

    lspconfig.tsserver.setup{
  -- Or use `tsserver = require('typescript-tools')` depending on your plugin setup
      name = "tsserver",
    cmd = { "typescript-language-server", "--stdio" },
  -- your settings here
    }

    lspconfig.clangd.setup({
        cmd = { "clangd" },
        filetypes = { "c", "cpp" },  -- Supports both C and C++
        capabilities = capabilities,
        on_attach = on_attach,  -- Optional: Reuse shared on_attach
        -- clangd-specific settings (optional)
        settings = {
          clangd = {
            fallbackFlags = { "-std=c17" },  -- Default C standard
          },
        },
      })
    end,
  },
}

