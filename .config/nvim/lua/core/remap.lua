-- just for easy mapping ------------------------------------
function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

function vmap(shortcut, command)
  map('v', shortcut, command)
end
-- key-mapping -----------------------------------------
nmap('<leader>ff',':Files<CR>')
nmap('<leader>fg',':Rg<CR>')
nmap('<leader>fb',':Buffers<CR>')
nmap('<leader>gs',':Rg <C-R><C-W><CR>')
vmap('<leader>gs',':<C-U>Rg "<C-R>\\""<CR>')


-- go to next or previous error in errorFix list
nmap('<C-n>',':cn<CR>')
nmap('<C-p>',':cp<CR>')
-- 
-- " turn to next or previous errors, after open location list
nmap('<C-n>',':cnext<CR>')
nmap('<C-p>',':cprevious<CR>')

nmap('<leader>fs',':GoFillStruct<CR>')


-- go to definition
-- Code navigation shortcuts
nmap('<C-]>',':lua vim.lsp.buf.definition()<CR>')
nmap('K',':lua vim.lsp.buf.hover()<CR>')
nmap('gD',':lua vim.lsp.buf.implementation()<CR>')
nmap('<C-k>',':lua vim.lsp.buf.signature_help()<CR>')
nmap('1gD',':lua vim.lsp.buf.type_definition()<CR>')
nmap('gr',':lua vim.lsp.buf.references()<CR>')
nmap('g0',':lua vim.lsp.buf.document_symbol()<CR>')
nmap('gW',':lua vim.lsp.buf.workspace_symbol()<CR>')



-- temp  key map
nmap('<C-d>','<C-d>zz')
nmap('<C-u>','<C-u>zz')
nmap('<S-h>','<S-h>zz')
nmap('<S-l>','<S-l>zz')
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])




nmap("ga", "<cmd>RustLsp codeAction<cr>", { desc = "Rust code action", silent = true, noremap = true })

vim.api.nvim_create_user_command(
  'Diag',
  function()
    vim.diagnostic.setqflist()
    vim.cmd('copen')
  end,
  {}
)
