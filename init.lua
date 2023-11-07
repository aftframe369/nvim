vim.g.mapleader=' '

require 'lazypath'
require 'myconfig'
require 'mappings'

vim.cmd.colorscheme 'rusticated'
vim.o.background = 'light'
vim.api.nvim_set_hl(0, "Normal", {bg="none"})
vim.api.nvim_set_hl(0, "NormalFloat", {bg="none"})
 
require 'setup.telescope'
require 'setup.treesitter'
require 'setup.lsp'
