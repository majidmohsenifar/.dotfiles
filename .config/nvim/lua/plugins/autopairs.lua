return {
{
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    local npairs = require("nvim-autopairs")
    local Rule = require("nvim-autopairs.rule")

    npairs.setup({})

    npairs.add_rules({
    Rule('|', '|', {'rust'}) -- Applies to Lua, Python, and JS files
})
  end,
}
}

-- Example setup using lazy.nvim
