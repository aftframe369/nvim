vim.keymap.set({ 'n', 'v' }, '<F5>', ':w<CR><C-W>v<C-W>l:term python3 "%"<CR>i') --save, run python script, open in new terminal in split window
vim.keymap.set('i', '<F5>', '<Esc>:w<CR><C-W>v<C-W>l:term python3 "%"<CR>i')
vim.keymap.set({ 'n', 'v' }, '<F6>', ':w<CR>:tabnew %<CR>:term python3 "%"<CR>i')
vim.keymap.set('i', '<F6>', '<Esc>:w<CR>:tabnew %<CR>:term python3 "%"<CR>i')

