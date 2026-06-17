vim.g.mapleader = ' '

-- inne configi dla innych komputerów
if vim.env.CHROMEBOOK == "1" then
	vim.g.Chromebook = true
else
	vim.g.Chromebook = false
end

if vim.env.DELL_LAPTOP == "1" then
	vim.g.DELL = true
else
	vim.g.DELL = false
end

vim.g.TERM_BRIGHTNESS = vim.env.COLORS

-- kolejność zostałą dobrana tak, aby maksymalizować funkcjonalość
-- jak coś zesram w konfiguracji
vim.g.python3_host_prog = '/home/maciej/.config/nvim/PyProvider/bin/python3'

require 'myconfig'
require 'mappings'

vim.o.cursorline = true
vim.o.conceallevel = 1


require 'lazypath'
require('lazy').setup({
	require 'themes',
	require 'plugins'
}, {})

require 'setup.treesitter'
require 'setup.telescope'
require 'setup.lsp'

-- load colors again if all went well
if vim.g.DELL == true then
	vim.cmd.colorscheme 'rose-pine-moon'
else
	vim.cmd.colorscheme 'melange'
end

require("utils.colors").color()

