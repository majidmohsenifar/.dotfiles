return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufReadPre",  -- Lazy load on file read
    config = function()
      require("todo-comments").setup({
        keywords = {
          TODO = { icon = " ", color = "info" },
          HACK = { icon = " ", color = "warning" },
          WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        },
        gui_style = {
          fg = "NONE",  -- The gui style for the foreground highlight group.
          bg = "BOLD",  -- The gui style for the background highlight group.
        },
        highlight = {
          multiline = true,  -- Enable multiline todo comments
          multiline_pattern = "^.",  -- Pattern to match the next multiline from the start of the matched keyword
          multiline_context = 10,  -- Extra lines that will be reevaluated when changing a line
          before = "",  -- "fg" or "bg" or empty
          keyword = "wide",  -- Keyword highlighting style
          after = "fg",  -- After keyword highlighting style
          pattern = [[.*<(KEYWORDS)\s*:]],  -- Pattern used for highlighting
          comments_only = true,  -- Use treesitter to match keywords only in comments
          max_line_len = 400,  -- Ignore lines longer than this
          exclude = {},  -- File types to exclude from highlighting
        },
        colors = {
          error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
          warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
          info = { "DiagnosticInfo", "#2563EB" },
          hint = { "DiagnosticHint", "#10B981" },
          default = { "Identifier", "#7C3AED" },
          test = { "Identifier", "#FF00FF" },
        },
        search = {
          command = "rg",  -- Use ripgrep for searching
          args = {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
          },
          pattern = [[\b(KEYWORDS):]],  -- Ripgrep pattern for keywords
        },
      })
    end,
  },
}

