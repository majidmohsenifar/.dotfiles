return {
  {
    "numToStr/Comment.nvim",
    config = function()
    require('Comment').setup({
         mappings = {
           basic = {
             -- Toggle comment for current line with Leader + c + Space
             -- gcc = '<leader>c<Space>',  -- Leader + c + Space
           },
           extra = {
             -- Toggle comment for selected lines with Leader + c + Space
             -- gc = '<leader>c<Space>',  -- Leader + c + Space
           },
         },
})
    end
  }
}
