local function func()
	local remap = vim.keymap.set
	local modes = { 'n', 'x', 'o' }

	local leap = require('leap')
	leap.opts.case_sensitive = false

	remap(modes, 's', '<Plug>(leap-forward-to)')
	remap(modes, 'gs', '<Plug>(leap-backward-to)')

	vim.keymap.set({'n', 'x', 'o'}, 'gS', function ()
	  require('leap.remote').action()
	end)

	vim.api.nvim_set_hl(0, 'LeapLabel', { link = "Search", bold = true })
end
return func
