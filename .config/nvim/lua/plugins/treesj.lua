return {
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },  -- Ensure treesitter is installed
    event = "BufReadPre",  -- Lazy load when opening a file
    config = function()
      require('treesj').setup({
        use_default_keymaps = false,  -- Disable default keymaps
      })
      
      -- Custom keymap for toggling Treesj
      vim.api.nvim_set_keymap('n', 'gj', ':TSJToggle<CR>', { noremap = true, silent = true })
    end,
  },
}

