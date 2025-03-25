local remap = vim.keymap.set

local all = { 'o', 'n', 'v', 'x' }

-- vim.keymap.set('i', '<C-x>', '<C-x><C-f>')
-- D szybsze niż dd, a nie podoba mi się Vd
remap(all, 'D', 'dd')

-- q przesuwa do początku słowa na lewo. Bardziej intuicyjne, bo na lewo od 'w'
-- Q przesuwa do początku SŁOWA na lewo. Bardziej intuicyjne, bo na lewo od 'w'
remap(all, 'q', 'b')
remap(all, 'Q', 'B')

--Ctrl backspace usuwa całe słowo w insert mode
remap('i', '<C-BS>', '<C-W>')
--Ctrl delete usuwa słowo w insert mode
remap('i', '<C-del>', '<Esc>ce')

--Enter in normal mode starts insert in line below
remap('n', '<CR>', 'o')
--
-- replace dolar with - as go to end of line, way better and next to 0 - start of line
remap(all, '-', '$')

-- 0 jako pierwszy znak, a nie początek linijki. Częściej używane to zamieniam je.
remap(all, '0', '^')
remap(all, '^', '0')

--use J and K to move lines up and down
remap('n', 'K', ':m .-2<CR>==')
remap('n', 'J', ':m .+1<CR>==')
remap("v", "J", ":m '>+1<CR>gv=gv")
remap("v", "K", ":m '<-2<CR>gv=gv")
remap({ 'n', 'v' }, 'L', 'J', { noremap = true })
remap({ 'n', 'v' }, 'H', 'K', { noremap = true })

--bb jumps to matching brackets
remap(all, 'b', '%')

-- remap('n', '<leader>e', ':Explore<CR>')
remap('n', '<leader>e', ':Oil<CR>')

remap({ 'v', 'n' }, '<C-c>', '"+y"')
remap('n', '<leader><leader>', '<c-^>zz',
  { silent = false, noremap = true, desc = 'Previous buffer' })

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


local definition = [[([\=\,\:]\s{-}|\t|\s{2,})@<=(\w)]]
local after_bracket = [[(['"({[<>]\s?)@<=(\w|[:\-%$^&*#@!+|])]]
local after_dot = [[(['"\>)}]\.)@<=(\w)]]
local first_word = [[^(\w)]]
local char_in_quotes = [[(['"])@<=\S?(['"])]]

local pattern = [[\v]] .. 
              definition .. "|" ..
              after_bracket .. "|" ..
              after_dot .. "|" ..
              first_word .. "|" ..
              char_in_quotes

vim.keymap.set({ 'n', 'v' }, '<A-w>', function()
  vim.fn.search(pattern)
end)
vim.keymap.set({ 'n', 'v' }, '<A-q>', function()
  vim.fn.search(pattern, 'b')
end)

-- save and source current file
vim.keymap.set('n', '<leader>so', ':w<CR>:so<cr>')
vim.keymap.set('i', '<C-j>', '<Esc>')

vim.keymap.set('i', '<C-j>', '<Esc>')

vim.api.nvim_create_user_command("Dark", function ()
  vim.o.background = 'dark'
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(5, "NormalFloat", { bg = "none" })
end, { desc = 'darkmode' })

vim.api.nvim_create_user_command("Light", function()
  vim.o.background = 'light'
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(5, "NormalFloat", { bg = "none" })
end, { desc = 'lightmode' })

remap(all, 'gx', function ()
  vim.fn.execute(":!xdg-open "..vim.fn.expand("<cfile>"))
end)

remap(all, '<leader>gp', ":!/home/maciej/.config/nvim/.pushnotes.sh push<CR>", { desc = "pushnotes"})
remap(all, '<leader>gd', ":!/home/maciej/.config/nvim/.pushnotes.sh pull<CR>", { desc = "pullnotes"})

remap("n", "<leader>sv", ":source $MYVIMRC<CR>")

remap("n", "<leader>sc", function()
  print(vim.opt.spell:get())
  if vim.opt.spell:get() == false then
    vim.opt.spelllang="pl"
    vim.opt.spell=true
  else
    vim.opt.spell = false
  end
end,
  { desc="spellcheck" }
)
remap("n", "zn", "]s", { desc = "następny błąd"})
remap("n", "zN", "[s", { desc = "poprzedni błąd"})
remap("n", "z<leader>", function() vim.fn.feedkeys('z=') end, { desc = "Menu poprawek"})
remap("n", "z/", function() vim.fn.feedkeys('1z=') end, { desc = "Popraw na pierwszą sugestię"})
remap("n", "z.", function() vim.fn.feedkeys(']s1z=') end, { desc = "Popraw następny automatycznie"})

-- new recording mapping
remap("n", "<A-r>", "q", {desc = "recording"})

remap("n", "<leader>o", function() vim.fn.append(vim.fn.line(".")-1, "") end)
remap("n", "<leader><CR>", function() vim.fn.append(vim.fn.line("."), "") end)
remap("n", "<leader>O", function() vim.fn.append(vim.fn.line("."), "") end)
