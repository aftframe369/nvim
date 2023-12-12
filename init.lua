vim.g.mapleader = ' '

require 'lazypath'
require('lazy').setup({
  require 'themes',
  require 'kickstart',
  require 'plugins'
}, {})

require 'myconfig'
require 'mappings'

vim.cmd.colorscheme 'melange'
vim.o.background = 'light'

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(5, "NormalFloat", { bg = "none" })

require 'setup.telescope'
require 'setup.treesitter'
require 'setup.lsp'

