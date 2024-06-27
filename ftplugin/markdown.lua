vim.keymap.set('v', '<C-b>', 'c****<esc>hP', { buffer = 0 })
vim.keymap.set('v', '<C-i>', 'c**<esc>P', { buffer = 0 })

vim.keymap.set({ 'n', 'i', 'v' }, '<F5>', '<Esc>:w|'..
	'!pandoc -i "%" -o "%:r.pdf" ' ..
	"--pdf-engine=lualatex " ..
	"-V 'monofont: DejaVuSans Mono.ttf' " ..
	"-V lang=pl " ..
	"--highlight-style pygments" ..
	"<CR>"

)

vim.keymap.set({ 'n', 'i', 'v' }, '<F6>', ':!zathura "%:r.pdf" & disown<CR>')

vim.keymap.set({ 'n', 'i', 'v' }, '<F7>', '<Esc>:w|'..
'!pandoc -t revealjs -s "%" -o "%:r.html"<CR>')
