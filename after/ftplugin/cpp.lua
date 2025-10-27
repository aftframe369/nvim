vim.keymap.set(
	{ 'n', 'i', 'v' },
	'<F5>',
	'<Esc>:w<CR>' ..
	':! g++ "%" -Wall -Wextra -o "%:r.o"<CR>' ..
	':! ./"%:r.o"',
	{ buffer = 0 }
)

-- tylko kompilacja
vim.keymap.set(
	{ 'n', 'i', 'v' },
	'<F6>',
	'<Esc>:w<CR>' ..
	':! g++ "%" -Wall -Wextra -o "%:r.o"<CR>',
	{ buffer = 0 }
)

