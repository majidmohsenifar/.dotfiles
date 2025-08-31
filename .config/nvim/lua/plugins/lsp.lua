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
            virtual_text = {
              prefix = '●',
              spacing = 4,
              delay = 200, -- delay in ms before showing virtual text
            },
            --signs = true,
            underline = true,
            update_in_insert = false,

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

