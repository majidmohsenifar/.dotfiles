-- copilot configs -----------------------------------
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.api.nvim_set_keymap("i", "<C-y>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.g.copilot_proxy = '127.0.0.1:2080' 
--vim.g.copilot_proxy = '192.168.1.101:1080' 

