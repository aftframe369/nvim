if vim.fn.getline(1) == "" then
	vim.fn.append(0, "#!/bin/bash")
end


vim.keymap.set('n', '<F5>', ":w | ! '%'<CR>", { buffer = 0 })

