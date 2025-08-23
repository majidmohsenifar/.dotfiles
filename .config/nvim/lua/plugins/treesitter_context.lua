return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesitter-context").setup{
        enable = true,              -- Enable this plugin
        max_lines = 0,              -- 0 means no limit to context lines shown
        min_window_height = 0,      -- Show even in small windows
        trim_scope = 'outer',       -- Which context to trim when exceeding max_lines
        patterns = {                -- Which syntax nodes to show
          default = {
            'class',
            'function',
            'method',
            'for',
            'while',
            'if',
            'switch',
            'case',
          },
        },
        mode = 'cursor',            -- Only show context relevant to cursor
      }
    end
  }
}
