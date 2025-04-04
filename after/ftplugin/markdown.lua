vim.opt_local.comments = { "b:- [ ]", "sb:- [x]", "mb:- [ ]",
	"eb:- [ ]", "b:*", "b:-", "b:+" }
vim.bo.formatoptions = vim.bo.formatoptions .. "r"

vim.keymap.set('v', '<C-b>', 'c****<esc>hP', { buffer = 0 })
vim.keymap.set('v', '<C-i>', 'c**<esc>P', { buffer = 0 })

vim.keymap.set('n', '<leader>ch', function()
	local line = vim.fn.getline('.')
	if string.find(line, '%- %[ %]') then
		vim.cmd([[s/\V[ ]/[x]/]])
		vim.cmd('nohlsearch')
	elseif string.find(line, '%- %[x%]') then
		vim.cmd([[s/\V[x]/[ ]/]])
		vim.cmd('nohlsearch')
	else
		vim.cmd([[s/\v^/- [ ]/]])
		vim.cmd('nohlsearch')
	end
end
)

local pandoc = require("utils.pandoc")
local render_in_latex = pandoc.pandoc_md_2_pdf

vim.keymap.set({ 'n', 'i', 'v' }, '<F5>',
	function()
		vim.api.nvim_command(":w")
		vim.fn.jobstart(
			table.concat(render_in_latex(), " "),
			{
				on_stdout = function(chanid, data, name)
					print("stdout, data:" .. table.concat(data, ""))
				end,
				on_stderr = function(chanid, data, name)
					print(table.concat(data, ""))
				end,
				on_exit = function(id, exitcode, event)
					print("exit, exitcode:" .. vim.inspect(exitcode))
				end,
			}
		)
	end
)

vim.keymap.set({ 'n', 'i', 'v' }, '<F6>', ':!zathura "%:r.pdf" & disown<CR>')
