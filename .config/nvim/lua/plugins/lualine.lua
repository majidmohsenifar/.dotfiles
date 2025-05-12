return {
  {
    "nvim-lualine/lualine.nvim",
    event = "BufReadPre",
    config = function()
      require("lualine").setup({
        options = { theme = "gruvbox" },
        sections = {
          lualine_c = { { "filename", file_status = true, path = 1 } },
        },
      })
    end,
  },
}

