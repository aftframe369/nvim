-- vim.keymap.set('i', '<C-x>', '<C-x><C-f>')
vim.keymap.set({ 'o', 'n', 'v' }, 'q', 'b')                                      -- q przesuwa do początku słowa na lewo. Bardziej intuicyjne, bo na lewo od 'w'
vim.keymap.set({ 'o', 'n', 'v' }, 'Q', 'B')                                      -- Q przesuwa do początku SŁOWA na lewo. Bardziej intuicyjne, bo na lewo od 'w'
vim.keymap.set('i', '<C-H>', '<C-W>')                                            --Ctrl backspace usuwa całe słowo w insert mode
vim.keymap.set('i', '<C-del>', '.<Esc>ce')                                       --Ctrl delete usuwa słowo w insert mode
vim.keymap.set('n', '<CR>', 'o')                                                 --Enter in normal mode stars insert in line below
vim.keymap.set({ 'o', 'n' }, '-', '$')                                           -- replace dolar with - as go to end of line, way better and next to 0 - start of line

vim.keymap.set({'o', 'n', 'v'}, '<C-t>', '<Esc>:tabnew ')

vim.keymap.set('n', 'J', ':m .-2<CR>==')        --use J and K to move lines up and down
vim.keymap.set('n', 'K', ':m .+1<CR>==')
vim.keymap.set('v','K', ':m <+1<CR>gv=gv')
vim.keymap.set('v','J', ':m <-2<CR>gv=gv')



--primegeans moving line up and down in vmode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")