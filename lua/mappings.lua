-- vim.keymap.set('i', '<C-x>', '<C-x><C-f>')
vim.keymap.set({ 'o', 'n', 'v' }, 'q', 'b')                                      -- q przesuwa do początku słowa na lewo. Bardziej intuicyjne, bo na lewo od 'w'
vim.keymap.set({ 'o', 'n', 'v' }, 'Q', 'B')                                      -- Q przesuwa do początku SŁOWA na lewo. Bardziej intuicyjne, bo na lewo od 'w'
vim.keymap.set('i', '<C-H>', '<C-W>')                                            --Ctrl backspace usuwa całe słowo w insert mode
vim.keymap.set('i', '<C-del>', '.<Esc>ce')                                       --Ctrl delete usuwa słowo w insert mode
vim.keymap.set('n', '<CR>', 'o')                                                 --Enter in normal mode starts insert in line below
vim.keymap.set({ 'o', 'n', 'v' }, '-', '$')                                           -- replace dolar with - as go to end of line, way better and next to 0 - start of line

vim.keymap.set({'o', 'n', 'v'}, '<C-t>', '<Esc>:tabnew ')    -- ctrl - t makes a new tab (click enter to confirm)

vim.keymap.set('n', 'J', ':m .-2<CR>==')        --use J and K to move lines up and down
vim.keymap.set('n', 'K', ':m .+1<CR>==')
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set({'o', 'n', 'v'}, 'bb', '%')  --bb jumps to matching brackets
-- vim.keymap.set({'o', 'n', 'v'}, 'bc', ']*') --bc and Bc jumps to next or previous comments
-- vim.keymap.set({'o', 'n', 'v'}, 'Bc', '[*')
vim.keymap.set({'o', 'n', 'v'}, 'bm', ']m') --bm and Bm jumps to next or previous method
vim.keymap.set({'o', 'n', 'v'}, 'Bm', '[m')

vim.keymap.set('n', '<leader>e', ':Explore<CR>') 


