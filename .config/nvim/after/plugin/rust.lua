vim.g.rustaceanvim = {
  -- Plugin configuration
    tools = { -- rust-tools options
        autoSetHints = true,
        inlay_hints = {
            show_parameter_hints = true,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },
  -- LSP configuration
  server = {
    on_attach = function(client, bufnr)
      -- you can also put keymaps in here
    end,
    default_settings = {
      -- rust-analyzer language server configuration
      ['rust-analyzer'] = {
        checkOnSave = {
          command = "clippy",
        },

        diagnostics = {
              enable = true,
              disabled = {"unresolved-proc-macro"},
              enableExperimental = true,
        },
      },
    },
  },
  -- DAP configuration
  dap = {
  },
}

---- rust-------------------------------------------------
vim.g.rustfmt_autosave = 0
--vim.g.rustfmt_emit_files = 1
--vim.g.rustfmt_fail_silently = 0
