local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'

  -- Go
  --use { 'fatih/vim-go', ft = 'go' } 
  use {'fatih/molokai', ft = 'go'} 

  use 'ray-x/go.nvim'


  -- Rust
  use {
      'mrcjkb/rustaceanvim',
      version='^5',
      lazy = false, -- This plugin is already lazy
      ft = 'rust',
  }
  --use 'simrat39/rust-tools.nvim'
  use 'simrat39/inlay-hints.nvim'
  use {'rust-lang/rust.vim', ft = 'rust'}

  -- fzf
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim' 

  -- autopairs
  use 'windwp/nvim-autopairs'

  -- comment
  use 'preservim/nerdcommenter' 

  -- treesitter
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'kyazdani42/nvim-web-devicons' 
  
-- Completion framework:
  use 'hrsh7th/nvim-cmp' 
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-vsnip'                             
  use 'hrsh7th/cmp-path'                              
  use 'hrsh7th/cmp-buffer'                            
  use 'hrsh7th/vim-vsnip'

  -- todo comments
  use { 'folke/todo-comments.nvim', requires = 'nvim-lua/plenary.nvim'}

  -- Copilot
  use 'github/copilot.vim'

  -- git
  use 'lewis6991/gitsigns.nvim'

  -- dap
  use 'mfussenegger/nvim-dap'
  use 'leoluz/nvim-dap-go'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }
  use 'theHamsta/nvim-dap-virtual-text'

  -- lualine
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- file explorer
  use 'stevearc/oil.nvim'

  -- splitting/joining blocks of code 
  use{'Wansmer/treesj'}

  use({
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!:).
	run = "make install_jsregexp"
  })

  use "rafamadriz/friendly-snippets"

  use 'stevearc/dressing.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'MunifTanjim/nui.nvim'
  use 'MeanderingProgrammer/render-markdown.nvim'
  use 'nvim-tree/nvim-web-devicons' -- or use 'echasnovski/mini.icons'
  use 'HakonHarnes/img-clip.nvim'
  use 'zbirenbaum/copilot.lua'

  -- Avante.nvim with build process
  use {
    'yetone/avante.nvim',
    branch = 'main',
    run = 'make',
    config = function()
      require('avante').setup()
    end
  }


  if packer_bootstrap then
        require('packer').sync()
    end
end)

