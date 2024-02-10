local remap = vim.keymap.set
local all = { 'o', 'n', 'v', 'x' }

-- vim.keymap.set('i', '<C-x>', '<C-x><C-f>')
remap(all, 'q', 'b')               -- q przesuwa do początku słowa na lewo. Bardziej intuicyjne, bo na lewo od 'w'
remap(all, 'D', 'dd')               -- q przesuwa do początku słowa na lewo. Bardziej intuicyjne, bo na lewo od 'w'
remap(all, 'Q', 'B')               -- Q przesuwa do początku SŁOWA na lewo. Bardziej intuicyjne, bo na lewo od 'w'
remap('i', '<C-BS>', '<C-W>')                     --Ctrl backspace usuwa całe słowo w insert mode
remap('i', '<C-del>', '<Esc>ce')                --Ctrl delete usuwa słowo w insert mode
remap('n', '<CR>', 'o')                          --Enter in normal mode starts insert in line below
remap(all, '-', '$')               -- replace dolar with - as go to end of line, way better and next to 0 - start of line
remap(all, '0', '^')               -- replace dolar with - as go to end of line, way better and next to 0 - start of line

remap(all, '<C-t>', '<Esc>:tabnew ') -- ctrl - t makes a new tab (click enter to confirm)

remap('n', 'K', ':m .-2<CR>==')                  --use J and K to move lines up and down
remap('n', 'J', ':m .+1<CR>==')
remap("v", "J", ":m '>+1<CR>gv=gv")
remap("v", "K", ":m '<-2<CR>gv=gv")
remap('n', 'L', 'J', { noremap = true })

remap(all, 'b', '%') --bb jumps to matching brackets

remap('n', '<leader>e', ':Explore<CR>')

remap('n', '<Tab>', '}') --Use tab to jump to next paragraph

remap('v', '<C-c>', '"+y"')
remap('n', '<leader><leader>', '<c-^>zz', { silent = false, noremap = true, desc = 'Previous buffer' })


remap({ 'n', 'v' }, '<leader>ws', ':sp<CR>', { desc = 'Split Horizontal' })
remap({ 'n', 'v' }, '<leader>wv', ':vs<CR>', { desc = 'Split Vertically' })
remap({ 'n', 'v' }, '<leader>wn', ':new<CR>', { desc = 'New window' })
remap({ 'n', 'v' }, '<leader>wq', ':q<CR>', { desc = 'Close window' })
remap({ 'n', 'v' }, '<leader>wx', '<C-w>x', { desc = 'Swap windows with previous' })
remap({ 'n', 'v' }, '<leader>wj', '<C-w>j', { desc = 'Go to window j' })
remap({ 'n', 'v' }, '<leader>wk', '<C-w>k', { desc = 'Go to window k' })
remap({ 'n', 'v' }, '<leader>wh', '<C-w>h', { desc = 'Go to window h' })
remap({ 'n', 'v' }, '<leader>wl', '<C-w>l', { desc = 'Go to window l' })
remap({ 'n', 'v' }, '<leader>wp', '<C-w>p', { desc = 'Go to previous window' })
remap({ 'n', 'v' }, '<leader>w]', '<C-w>v<C-]>', { desc = 'open file in new window' })
remap({ 'n', 'v' }, '<leader>wf', '<C-w>_', { desc = 'Max window height' })
-- nmap('D', vim.lsp.buf.hover, 'Hover Documentation')  HOVER THE Documentation - copy from lsp.lua, for reference

-- The coolest (WORD) movement - jump to every interesting text
-- Includes - the dumbest regex you have ever seen
--
-- ['"({[< ]@<=(\w)
-- match any word (equivalent to [A-Za-z0-9]) character if 
-- there is '"({[< or space before it (probably \s would be better as it 
-- would also match words preceded by tabs, not spaces)
--
-- ^(\w)
-- match any word character if it is on the beggining of line
--
-- ([]'"\>)}]\.)@<=(\w)
-- match any word character if it is preceded by a dot
-- which itself is precedeed by '"\>)}]
--
-- (['"])@<=([][(){}.,;])(['"])]]
-- this one will match any of ][(){}.,; if they are sorrunded by " or '
-- will match ';', ";' and ';" which is funny, but not that big of a deal
-- Add any delimiters i have not included inside the [][(){}.,;]

local pattern = [[\v['"({[<> ]@<=(\w)|^(\w)|(['"\>)}]\.)@<=(\w)|(['"])@<=([][(){}.,;])(['"])]]
vim.keymap.set({'n', 'v'}, '<A-w>', function()
  vim.fn.search(pattern)
end)
vim.keymap.set({'n', 'v'}, '<A-q>', function()
  vim.fn.search(pattern, 'b')
end)

vim.keymap.set('n', '<leader>so', ':w<CR>:so<cr>')

vim.api.nvim_create_user_command("Obsydian", ':Explore  ~/Dokumenty/kisling/',  {desc='open obsidian notes directory'})

vim.api.nvim_create_user_command("Dark", function ()
  vim.o.background = 'dark'
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(5, "NormalFloat", { bg = "none" })
end, {desc='darkmode'})

vim.api.nvim_create_user_command("Light", function ()
  vim.o.background = 'light'
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(5, "NormalFloat", { bg = "none" })
end, {desc='lightmode'})

