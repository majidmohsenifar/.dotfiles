return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },  -- Ensure textobjects are installed
    event = "BufReadPre",  -- Lazy load when opening a file
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { 'go', 'lua', 'rust' },  -- Add languages here
        highlight = { enable = true },  -- Enable highlighting
        indent = { enable = true },  -- Enable indenting
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<c-backspace>',
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,  -- Automatically jump forward to textobj
            keymaps = {
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
              ['ii'] = '@conditional.inner',
              ['ai'] = '@conditional.outer',
              ['il'] = '@loop.inner',
              ['al'] = '@loop.outer',
              ['at'] = '@comment.outer',
            },
          },
          move = {
            enable = true,
            set_jumps = true,  -- Set jumps in the jumplist
            goto_next_start = {
              [']]'] = '@function.outer',
              [']m'] = '@class.outer',
            },
            goto_previous_start = {
              ['[['] = '@function.outer',
              ['[m'] = '@class.outer',
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ['<leader>a'] = '@parameter.inner',
            },
            swap_previous = {
              ['<leader>A'] = '@parameter.inner',
            },
          },  -- This comma was missing
        },
      })
    end,
  },
}
