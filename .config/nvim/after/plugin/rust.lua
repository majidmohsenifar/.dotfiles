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
        cargo = {
         allFeatures = true,
         unstableFeatures = true,
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
--
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.rs",
  callback = function()
    if vim.fn.findfile("Cargo.toml", ".;") == "" then return end

    -- Save view state
    local view = vim.fn.winsaveview()

    -- Run `cargo fmt` async and restore view afterward
    vim.fn.jobstart({ "cargo", "fmt" }, {
      stdout_buffered = true,
      on_exit = function()
        vim.schedule(function()
          vim.cmd("silent! e!")
          vim.fn.winrestview(view)  -- Restore scroll/cursor
        end)
      end,
    })
  end,
})
