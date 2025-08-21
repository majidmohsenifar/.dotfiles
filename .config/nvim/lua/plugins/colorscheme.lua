return {
  {
    "Lokaltog/vim-monotone",
    name = "monotone",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme monotone")
    end,
  },
}

