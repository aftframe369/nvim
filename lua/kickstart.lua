return {

  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',

      -- -- Navbuddy, use :Navbuddy to quickly jump to objects and functions in buffer
      -- {
      --     "SmiteshP/nvim-navbuddy",
      --     dependencies = {
      --         "SmiteshP/nvim-navic",
      --         "MunifTanjim/nui.nvim"
      --     },
      --     opts = { lsp = { auto_attach = true } }
      -- },

    },
  },






}
