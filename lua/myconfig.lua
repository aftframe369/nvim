-- My config
--
--
-- Load a pretty theme before loading plugins, 
-- helps keep sanity when messing with config and something breaks
vim.cmd("so ~/.config/nvim/lua/setup/vim_colors/tokyonight-day.vim") 
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(5, "NormalFloat", { bg = "none" })

vim.api.nvim_set_hl(0, "Visual", { bg = "white" })
vim.api.nvim_set_hl(0, "CursorLine", { underline = true, sp = 'white' })

vim.o.cursorline = true
vim.wo.relativenumber = true
vim.wo.nu = true
vim.cmd('set whichwrap+=<,>,h,l,[,]')
vim.opt.incsearch = true
vim.opt.scrolloff = 20
vim.o.linebreak = true
vim.o.kp = ":help"

vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.netrw_list_hide = "^\\."

-- Set highlight on search
vim.o.hlsearch = true

-- Enable mouse mode
vim.o.mouse = 'a'
vim.o.mousescroll = 'ver:3'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
--
if vim.g.Chromebook == true then
	vim.o.clipboard = ''
else
	vim.o.clipboard = 'unnamed'
end

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- [[ Basic Keymaps ]]


vim.g.kp = ':help'

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

