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
	vim.api.nvim_set_hl(0, "CursorLine", { underline = true, sp = 'none' })
end

-- kolejność zostałą dobrana tak, aby maksymalizować funkcjonalość
-- jak coś zesram w konfiguracji
if vim.g.Chromebook then
	vim.g.python3_host_prog = '/home/maciej/programowanie/.venv_studia/bin/python3'
else
    vim.g.python3_host_prog = '/home/maciej/programowanie/.stud_venv/bin/python'
end

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
