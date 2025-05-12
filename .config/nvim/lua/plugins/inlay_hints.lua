return {
  "simrat39/inlay-hints.nvim",
  config = function()
    require("inlay-hints").setup({
      renderer = "inlay-hints/render/eol", -- Try alternative renderers
      hints = {
        parameter = {
          show = true,
          highlight = "Comment",
        },
        type = {
          show = true,
          highlight = "Comment",
        },
      },
      -- Try forcing inline rendering
      only_current_line = false,
      eol = {
        right_align = false, -- Disable right-aligned hints (may cause wrapping)
      },
    })
  end,
  event = "LspAttach", -- Optional: Load on LSP attach
}
