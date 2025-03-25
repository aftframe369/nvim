local function pandoc_md_2_pdf()
	local self = vim.fn.expand("%")
	local pdf = vim.fn.expand("%:r") .. ".pdf"
	local library = vim.fn.expand("%:h") .. "/library.bib"
	print(library)
	local command = { 'pandoc', '-i', vim.fn.fnameescape(self), "-o",
		vim.fn.fnameescape(pdf),
		"--pdf-engine=lualatex",
		"--citeproc",
		'--bibliography=' .. vim.fn.fnameescape(library),
		"-V", '"monofont: DejaVuSans Mono.ttf"',
		"-M", "lang=pl-PL", "--highlight-style", "espresso",
		"-V", "csquotes=true" }
	return command
end

local pandoc_script = "/home/maciej/Dokumenty/kisling/00 Inzynierka/bin/pdf_pipe.sh"


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

vim.keymap.set({ 'n', 'i', 'v' }, '<F4>',
	function()
		vim.api.nvim_command(":w")
		vim.fn.feedkeys(":!" .. table.concat(pandoc_md_2_pdf(), " "))
	end
)

vim.keymap.set({ 'n', 'i', 'v' }, '<F5>',
	function()
		vim.api.nvim_command(":w")
		vim.fn.jobstart(
			table.concat(pandoc_md_2_pdf(), " "),
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


vim.keymap.set({ 'n', 'i', 'v' }, '<F10>', function()
	vim.api.nvim_command(":w")
	vim.fn.jobstart(
		vim.fn.shellescape(pandoc_script),
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
