return {
  {
    "hrsh7th/vim-vsnip",
    event = "InsertEnter",  -- Lazy load when entering insert mode
    config = function()
      -- Set the snippet directory
      vim.g.vsnip_snippet_dir = '~/.config/nvim/vsnip'

      -- Key mappings for expanding, jumping, and selecting text in vsnip
      vim.api.nvim_set_keymap('i', '<Tab>', 'vsnip#jumpable(1) ? \'<Plug>(vsnip-jump-next)\' : \'<Tab>\'', { expr = true, noremap = true })
      vim.api.nvim_set_keymap('s', '<Tab>', 'vsnip#jumpable(1) ? \'<Plug>(vsnip-jump-next)\' : \'<Tab>\'', { expr = true, noremap = true })
      vim.api.nvim_set_keymap('i', '<S-Tab>', 'vsnip#jumpable(-1) ? \'<Plug>(vsnip-jump-prev)\' : \'<S-Tab>\'', { expr = true, noremap = true })
      vim.api.nvim_set_keymap('s', '<S-Tab>', 'vsnip#jumpable(-1) ? \'<Plug>(vsnip-jump-prev)\' : \'<S-Tab>\'', { expr = true, noremap = true })

      -- Key mappings for selecting and cutting text
      vim.api.nvim_set_keymap('n', 's', '<Plug>(vsnip-select-text)', { noremap = true })
      vim.api.nvim_set_keymap('x', 's', '<Plug>(vsnip-select-text)', { noremap = true })
      vim.api.nvim_set_keymap('n', 'S', '<Plug>(vsnip-cut-text)', { noremap = true })
      vim.api.nvim_set_keymap('x', 'S', '<Plug>(vsnip-cut-text)', { noremap = true })
    end,
  },
}

