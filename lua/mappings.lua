local remap = vim.keymap.set
local all = { 'o', 'n', 'v', 'x' }
-- vim.keymap.set('i', '<C-x>', '<C-x><C-f>')
remap({ 'o', 'n', 'v' }, 'q', 'b')                                      -- q przesuwa do początku słowa na lewo. Bardziej intuicyjne, bo na lewo od 'w'
remap({ 'o', 'n', 'v' }, 'Q', 'B')                                      -- Q przesuwa do początku SŁOWA na lewo. Bardziej intuicyjne, bo na lewo od 'w'
remap('i', '<C-H>', '<C-W>')                                            --Ctrl backspace usuwa całe słowo w insert mode
remap('i', '<C-del>', '.<Esc>ce')                                       --Ctrl delete usuwa słowo w insert mode
remap('n', '<CR>', 'o')                                                 --Enter in normal mode starts insert in line below
remap({ 'o', 'n', 'v' }, '-', '$')                                           -- replace dolar with - as go to end of line, way better and next to 0 - start of line

remap({'o', 'n', 'v'}, '<C-t>', '<Esc>:tabnew ')    -- ctrl - t makes a new tab (click enter to confirm)

remap('n', 'K', ':m .-2<CR>==')        --use J and K to move lines up and down
remap('n', 'J', ':m .+1<CR>==')
remap("v", "J", ":m '>+1<CR>gv=gv")
remap("v", "K", ":m '<-2<CR>gv=gv")
remap('n', 'L', 'J', {noremap=true})

remap({'o', 'n', 'v'}, 'bb', '%')  --bb jumps to matching brackets
-- remap({'o', 'n', 'v'}, 'bc', ']*') --bc and Bc jumps to next or previous comments
-- remap({'o', 'n', 'v'}, 'Bc', '[*')
remap({'o', 'n', 'v'}, 'bm', ']m') --bm and Bm jumps to next or previous method
remap({'o', 'n', 'v'}, 'Bm', '[m')

remap('n', '<leader>e', ':Explore<CR>')

remap('n', '<Tab>', '}')  --Use tab to jump to next paragraph

remap('v', '<C-c>', '"+y"')
remap('n', '<leader><leader>', '<c-^>zz', { silent = false, noremap = true, desc='Previous buffer' })


remap({'n', 'v'}, '<leader>ws', ':sp<CR>', {desc='Split Horizontal'})
remap({'n', 'v'}, '<leader>wv', ':vs<CR>', {desc='Split Vertically'})
remap({'n', 'v'}, '<leader>wn', ':new<CR>', {desc='New window'})
remap({'n', 'v'}, '<leader>wq', ':q<CR>', {desc='Close window'})
remap({'n', 'v'}, '<leader>wx', '<C-w>x', {desc='Swap windows with previous'})
remap({'n', 'v'}, '<leader>wj', '<C-w>j', {desc='Go to window j'})
remap({'n', 'v'}, '<leader>wk', '<C-w>k', {desc='Go to window k'})
remap({'n', 'v'}, '<leader>wh', '<C-w>h', {desc='Go to window h'})
remap({'n', 'v'}, '<leader>wl', '<C-w>l', {desc='Go to window l'})
remap({'n', 'v'}, '<leader>wp', '<C-w>p', {desc='Go to previous window'})
remap({'n', 'v'}, '<leader>w]', '<C-w>v<C-]>', {desc='open file in new window'})
remap({'n', 'v'}, '<leader>wf', '<C-w>_', {desc='Max window height'})
-- nmap('D', vim.lsp.buf.hover, 'Hover Documentation')  HOVER THE Documentation - copy from lsp.lua, for reference
