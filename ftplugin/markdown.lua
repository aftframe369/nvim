vim.keymap.set('v', '<C-b>', 'c****<esc>hP', { buffer = 0 })

vim.keymap.set('v', '<C-i>', 'c**<esc>P', { buffer = 0 })

vim.keymap.set({ 'n', 'i', 'v' }, '<F5>',
	function()
		vim.api.nvim_command(":w")

		local self = vim.fn.expand("%")
		local pdf = vim.fn.expand("%:r") .. ".pdf"
		local library = "~/Dokumenty/kisling/Studia/library.bib"
		vim.fn.jobstart(
			{
				'pandoc', '-i', self, "-o", pdf,
				"--pdf-engine=lualatex",
				"--citeproc",
				'--bibliography=' .. library,
				"-V", '"monofont: DejaVuSans Mono.ttf"',
				"-V", "lang=pl", "--highlight-style", "espresso",
				"-V", "csquotes=true"

			}, { pty=true }
		)
	end
)



vim.keymap.set({ 'n', 'i', 'v' }, '<F6>', ':!zathura "%:r.pdf" & disown<CR>')

vim.keymap.set({ 'n', 'i', 'v' }, '<F7>', '<Esc>:w|' ..
	'!pandoc -t revealjs -s "%" -o "%:r.html"<CR>')


--!pandoc -i "%" -o "%:r.pdf" --pdf-engine=lualatex --citeproc --bibliography="%:h/library.bib" -V "monofont: DejaVuSans Mono.ttf" -V lang=pl --highlight-style espresso
