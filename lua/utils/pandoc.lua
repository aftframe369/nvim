local M = {}

M.pandoc_md_2_pdf = function(hidden)
	local self = vim.fn.expand("%")
	local pdf = vim.fn.expand("%:r") .. ".pdf"
	local library = vim.fn.expand("%:h") .. "/library.bib"

	if vim.fn.filereadable(library) == 0 then
		print("Nie ma biblioteki")
		library = ""
	else
		library = '--bibliography=' .. vim.fn.fnameescape(library)
	end

	if hidden=="hidden" then
		pdf = vim.fn.expand("%:h") .. "/." .. vim.fn.expand("%:t:r") .. '.pdf'
		print(pdf)
	end

	local command = {
		'pandoc', '-i', vim.fn.fnameescape(self), "-o",
		vim.fn.fnameescape(pdf),
		"--pdf-engine=lualatex",
		"--citeproc",
		library,
		"-V", '"monofont: DejaVuSans Mono.ttf"',
		"-M", "lang=pl-PL", "--highlight-style", "espresso",
		"-V", "csquotes=true"
	}
	return command
end

M.pandoc_script = "/home/maciej/Dokumenty/kisling/00 Inzynierka/bin/pdf_pipe.sh"

return M
