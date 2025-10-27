local cmd = 'g++ "%" -o "%:r";"%:r"'
local output = vim.fn.expand("%:r")
local head = vim.fn.expand("%:h")
local file = vim.fn.expand("%")

vim.keymap.set({ 'n', 'i', 'v' }, '<F5>',
	function()
		vim.cmd("write")
		local rd = vim.fn.filereadable(head .. "/Makefile")
		if rd==1 then
			vim.cmd("!make test")
			vim.print(rd)
		else
			vim.cmd("!" .. cmd)
			vim.print("no makefile")
		end
	end,
	{ buffer = 0 }
)

vim.keymap.set({ 'n', 'i', 'v' }, '<F6>', '<ESC>:w<CR>: term ' .. cmd, { buffer = 0 })

vim.keymap.set({ 'n', 'i', 'v' }, '<F4>', '<ESC>:!make test<CR>', { buffer = 0 })
