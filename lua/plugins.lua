return {
	-- amend keymaps
	-- Git related plugins
	{ 'tpope/vim-fugitive', },

	-- Adds git releated signs to the gutter, as well as utilities for managing changes
	{
		'lewis6991/gitsigns.nvim',
		opts = {
			-- See `:help gitsigns.txt`
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '!' },
			},
		},
	},

	-- "gc" to comment visual regions/lines
	{ 'numToStr/Comment.nvim', opts = {} },

	-- Fuzzy Finder (files, lsp, etc)
	{
		'nvim-telescope/telescope.nvim',
		version = '*',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	-- Fuzzy Finder Algorithm which requires local dependencies to be built.
	-- Only load if `make` is available. Make sure you have the system
	-- requirements installed.
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make',
		cond = function()
			return vim.fn.executable 'make' == 1
		end,
	},

	-- Highlight, edit, and navigate code
	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
		},
		build = ":TSUpdate",
	},

	{
		'anuvyklack/keymap-amend.nvim',
		init = function()
			vim.keymap.amend = require('keymap-amend')
			local amend = vim.keymap.amend
			amend('n', '<Esc>',
				function(original)
					if vim.v.hlsearch and vim.v.hlsearch == 1 then
						vim.cmd('nohlsearch')
					else
						original()
					end
				end
				, { desc = 'delete highlight of search' })
		end
	},

	{ 'nvimtools/none-ls.nvim' },

	{
		"zeioth/none-ls-autoload.nvim",
		event = "BufEnter",
		dependencies = {
			"williamboman/mason.nvim",
			"zeioth/none-ls-external-sources.nvim",
			"nvimtools/none-ls.nvim"
		},
	},
	-- { 'dccsillag/magma-nvim' },


	-- autocompletion
	{
		'saghen/blink.compat',
		lazy = true,
		opts = {
			impersonate_nvim_cmp = true,
		},
	},
	{
		'saghen/blink.cmp',
		dependencies = require('setup.blink').deps,
		opts = require('setup.blink').opts,
		version = '1.*',
		init = require('setup.blink').init,
	},

	--lualine
	{
		'nvim-lualine/lualine.nvim',
		opts = {
			options = {
				icons_enabled = false,
				theme = 'auto',
				component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
			},
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { "os.date('%d-%m  %H:%M')" },
				lualine_c = { "filename", "diff" },
				lualine_x = { "vim.fn.getcwd():gsub('/home/maciej', '~')", 'filetype' }
			}
		},
	},

	-- surround word/selection in brackets, quotes etc.
	-- Added better custom mapping's
	-- S mnemonic to surround
	-- Si) to sourround with () in something
	-- Sd) to delete surrounding ()
	-- Sc)] to change surrounding () to []
	{ 'tpope/vim-surround',    init = require('setup.surround') },

	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {}
	},

	-- color picker r -> HSL/rgb switch
	{ 'ziontee113/color-picker.nvim', opts = {} },

	-- Useful plugin to show you pending keybinds.
	{ 'folke/which-key.nvim',         opts = require('setup.whichkey').opts },

	-- Add indentation guides even on blank lines
	{ require 'setup.blanklines' },

	--use tab to escape from brackets
	{
		'boltlessengineer/smart-tab.nvim',
		opts = {
			mapping = "<tab>",
		}
	},

	--Oil
	{ require("setup.oil") },

	-- leap to 2char sequence with s, or gs backwards.
	-- Two custom mappings nothing more, quite enough
	{ 'ggandor/leap.nvim', init = require('setup.leap') },

	-- obsydian integration plugin
	-- personal fork, that works with blink 1.0
	{
		"aftframe369/obsidian.nvim",
		-- dir = "/home/maciej/.programy/obsidian.nvim/",
		lazy = false,
		version = '*',
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- 'saghen/blink.compat',
			'saghen/blink.cmp',
		},
		opts = require("setup.obsydian").opts,
		init = require("setup.obsydian").init,
	},

	-- table mode, :tableMode or <leader>tm to enter table.
	{ 'dhruvasagar/vim-table-mode',  init = require('setup.vim_table_mode') },
	{ 'norcalli/nvim-colorizer.lua', opts = {} },


	 {'mfussenegger/nvim-jdtls'},
 }


