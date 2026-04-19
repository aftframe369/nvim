vim.g.mapleader = ' '

if vim.env.CHROMEBOOK == "1" then
	vim.g.Chromebook = true
else
	vim.g.Chromebook = false
end

function color()
	vim.o.background = 'light'
	-- vim.o.background = 'dark'
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(5, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "Visual", { bg = "MistyRose", fg="black" })
	vim.api.nvim_set_hl(0, "CursorLine", { bg="white", underline = false, sp = 'none' })
end

-- kolejność zostałą dobrana tak, aby maksymalizować funkcjonalość
-- jak coś zesram w konfiguracji
vim.g.python3_host_prog = '/home/maciej/.config/nvim/PyProvider/bin/python3'

require 'myconfig'
require 'mappings'

vim.o.cursorline = true
vim.o.conceallevel = 1

color()

require 'lazypath'
require('lazy').setup({
	require 'themes',
	require 'kickstart',
	require 'plugins'
}, {})

vim.cmd.colorscheme 'melange'

require 'setup.treesitter'
require 'setup.telescope'
require 'setup.lsp'

-- load colors again if not crashed
color()
