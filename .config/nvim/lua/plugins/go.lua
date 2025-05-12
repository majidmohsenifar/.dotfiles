return {
  {
    "ray-x/go.nvim",
    dependencies = { "ray-x/guihua.lua" }, -- GUI library used by go.nvim
    ft = { "go", "gomod" }, -- lazy load only for Go files
    config = function()
      require("go").setup({
        textobjects = false,
        tag_transform = "camelcase",
        tag_options = "json=",
        fillstruct = "gopls",
      })

      -- Format Go files with goimports on save
      local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          require("go.format").goimports()
        end,
        group = format_sync_grp,
      })
    end,
  },
}

