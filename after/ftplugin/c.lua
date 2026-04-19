local cmd = 'g++ "%" -o "%:r.o";"%:r.o"'
local output = vim.fn.expand("%:r")
local head = vim.fn.expand("%:h")
local file = vim.fn.expand("%")

vim.keymap.set({ 'n', 'i', 'v' }, '<F5>',
	function()
		vim.cmd("write")
		local MakefileReadable = vim.fn.filereadable(head .. "/Makefile")
		if MakefileReadable==1 then
			vim.cmd("!make test")
		else
			vim.cmd("!" .. cmd)
			vim.print("no makefile")
		end
	end,
	{ buffer = 0 }
)


vim.keymap.set({ 'n', 'i', 'v' }, '<F6>',
	function()
		vim.cmd("write")
		local MakefileReadable = vim.fn.filereadable(head .. "/Makefile")
		if MakefileReadable==1 then
			vim.cmd("!make build")
		else
			vim.cmd("!" .. cmd)
			vim.print("no makefile")
		end
	end,
	{ buffer = 0 }
)

