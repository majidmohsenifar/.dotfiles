return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 'rafamadriz/friendly-snippets' },

  -- use a release tag to download pre-built binaries
  version = '1.*',
  opts = {
    keymap = {
            preset = 'default',

            ['<C-y>'] = { 'accept', 'fallback_to_mappings' },
        },
    signature = { enabled = true },
    completion = {
             list = {
                selection = {preselect = false, auto_insert = true },
            }
    },
  },
  opts_extend = { "sources.default" }
}
