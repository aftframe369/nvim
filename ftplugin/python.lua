vim.keymap.set({ 'n', 'i', 'v' }, '<F5>', '<Esc>:w<CR>:! python "%"<CR>') --save, run python script, open in new terminal in split window
vim.keymap.set({ 'n', 'v' }, '<F6>', ':w<CR>:tabnew %<CR>:term python "%"<CR>')
vim.keymap.set('i', '<F6>', '<Esc>:w<CR>:tabnew %<CR>:term python "%"<CR>')
