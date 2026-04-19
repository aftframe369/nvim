vim.keymap.set({ 'n', 'i', 'v' }, '<F5>', '<Esc>:w<CR>:! python "%"<CR>', { buffer = 0 }) --save, run python script, open in new terminal in split window
vim.keymap.set({ 'n', 'v' }, '<F6>', ':w<CR>:tabnew %<CR>:term python "%"<CR>', { buffer = 0 })
vim.keymap.set('i', '<F6>', '<Esc>:w<CR>:tabnew %<CR>:term python "%"<CR>', { buffer = 0 })

if(vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t") == "biblioteka_web") then
	vim.bo.path = vim.bo.path .. "," .. vim.fn.getcwd() .. "/hub_disco/templates"
	print("w folderze django")
end

