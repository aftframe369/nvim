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
-- vim.o.background = 'dark'

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(5, "NormalFloat", { bg = "none" })

vim.api.nvim_set_hl(0, "Visual", { bg = "white" })
vim.api.nvim_set_hl(0, "CursorLine", { underline=true, sp='white'})
vim.o.cursorline = true

require 'setup.treesitter'
require 'setup.telescope'
require 'setup.lsp'
