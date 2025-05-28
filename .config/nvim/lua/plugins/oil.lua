return {
  {
    "stevearc/oil.nvim",
    lazy = false, -- Load immediately
   -- cmd = "Oil",  -- Lazy load on :Oil command
    config = function()
      require("oil").setup({
        keymaps = {
          ["<S-h>"] = "actions.toggle_hidden",
          ["-"] = "actions.parent",
          ["<CR>"] = "actions.select",
          ["_"] = "actions.close",
          ["<C-l>"] = "actions.refresh",
        },
        use_default_keymaps = false,
        view_options = {
          show_hidden = false,  -- Show hidden files and directories (set to true if you want to show them)
        },
      })

      -- Map '-' key to :Oil command
      vim.api.nvim_set_keymap("n", "-", ":Oil<CR>", { noremap = true, silent = true })
    end,
  },
}

