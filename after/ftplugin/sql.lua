vim.keymap.set({ 'n', 'i', 'v' }, '<F5>', 
	function()
		vim.cmd("!sqlfluff lint --dialect mariadb % | grep parsable -C 3")
	end,
	{ buffer = 0 })
