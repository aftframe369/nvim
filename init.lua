vim.g.mapleader=' '

require 'lazypath'
require('lazy').setup({
  require 'themes',
  require 'kickstart',
  require 'plugins'
}, {})

require 'myconfig'
require 'mappings'


vim.cmd.colorscheme 'rusticated'
vim.o.background = 'light'
vim.api.nvim_set_hl(0, "Normal", {bg="none"})
vim.api.nvim_set_hl(5, "NormalFloat", {bg="none"})

require 'setup.telescope'
require 'setup.treesitter'
require 'setup.lsp'
-- list = ['a', 'b']
-- list = [1, 2, 3, 4]
-- dict = { opts = pipi }
-- str = function('your amazing text').method.dict.string(x)
-- str = function('.')
vim.keymap.set('n', '<leader>so', ':w<CR>:so<cr>')

local pattern = [[\v['"({[< ]@<=(\w)|^(\w)|(['"\>)}]\.)@<=(\w)|(['"])@<=([][(){}.,;])(['"])]]
vim.keymap.set({'n', 'v'}, '<A-w>', function()
  vim.fn.search(pattern)
end)
vim.keymap.set({'n', 'v'}, '<A-q>', function()
  vim.fn.search(pattern, 'b')
end)


