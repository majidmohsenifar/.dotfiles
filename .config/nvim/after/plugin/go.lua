require('go').setup({
    textobjects = false,
    tag_transform = "camelcase",
    tag_options = 'json=',
    fillstruct = 'gopls',
})


--local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
--vim.api.nvim_create_autocmd("BufWritePre", {
  --pattern = "*.go",
  --callback = function()
   --require('go.format').goimport()
  --end,
  --group = format_sync_grp,
--})

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimports()
  end,
  group = format_sync_grp,
})
