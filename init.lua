vim.g.mapleader = ' '

if vim.env.CHROMEBOOK == 1 then
	Chromebook = true
else
	Chromebook = false
end

function color()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(5, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "Visual", { bg = "White" })
	vim.api.nvim_set_hl(0, "CursorLine", { underline = true, sp = 'none' })
	vim.o.background = 'light'
	-- vim.o.background = 'dark'
end

--vim.g.python3_host_prog = '/home/maciej/programowanie/.venv_studia/bin/python3'

-- kolejność zostałą dobrana tak, aby maksymalizować funkcjonalość
-- jak coś zesram w konfiguracji

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

-- load colors again if not crashed
color()

require 'setup.treesitter'
require 'setup.telescope'
require 'setup.lsp'





