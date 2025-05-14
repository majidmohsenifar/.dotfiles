return { 
    {
  "mg979/vim-visual-multi",
  branch = "master", -- ensure you're using the latest stable version
  event = "VeryLazy", -- or remove this to load immediately
init = function()
    -- Map <C-j> to move cursor down (next line) in visual multi mode
    vim.g.VM_maps = {
      -- ["Find Under"]         = "<C-d>", -- or whatever you use to start selection
      -- ["Find Subword Under"] = "<C-d>",
      ["Select Cursor Down"] = "<C-j>",
      ["Select Cursor Up"]   = "<C-k>",
    }
  end,
}
}

