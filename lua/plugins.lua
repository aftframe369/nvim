return {
	-- amend keymaps
	-- Git related plugins
	{ 'tpope/vim-fugitive', },
	{ 'tpope/vim-rhubarb', },

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
				changedelete = { text = '~' },
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
	--
	--	--formatter, DAP, Linter support for Mason
	--	{ 'mhartington/formatter.nvim', },
	--	{ 'mfussenegger/nvim-dap', },
	--	{ 'mfussenegger/nvim-dap-python', },
	--	{ 'mfussenegger/nvim-lint', },
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
	{ 'dccsillag/magma-nvim' },


	-- Autocompletion
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'SirVer/ultisnips',
			'honza/vim-snippets',
			'quangnguyen30192/cmp-nvim-ultisnips',
			-- 'L3MON4D3/LuaSnip',
			-- 'saadparwaiz1/cmp_luasnip'
		},
	},


	-- Set lualine as statusline
	-- See `:help lualine.txt`
	{
		'nvim-lualine/lualine.nvim',
		-- cond = not vim.g.Chromebook,
		opts = {
			options = {
				icons_enabled = false,
				theme = 'auto',
				component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
			},
			sections = {
					lualine_a = {'mode'},
					lualine_b = { "os.date('%d-%m  %H:%M')" },
					lualine_c = { "filename", "diff"},
					lualine_x = { "vim.fn.getcwd():gsub('/home/maciej', '~')", 'filetype'} }
			},
	},

	-- surround word/selection in brackets, quotes etc.
	-- Added better custom mapping's
	-- S mnemonic to surround
	-- Si) to sourround with () in something
	-- Sd) to delete surrounding ()
	-- Sc)] to change surrounding () to []
	{ 'tpope/vim-surround',          init = require('setup.surround') },

	-- -- autopair brackets and quotes
	-- { 'jiangmiao/auto-pairs', },
	--
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {}
	},

	-- color picker r -> HSL/rgb switch
	{ 'ziontee113/color-picker.nvim', opts = {} },

	-- java server
	--	{ 'mfussenegger/nvim-jdtls' },

	-- Useful plugin to show you pending keybinds.
	{ 'folke/which-key.nvim',         opts = {} },

	-- Add indentation guides even on blank lines
	{ require 'setup.blanklines' },

	--use tab to escape from brackets
	{
		'boltlessengineer/smart-tab.nvim',
		opts = {
			-- default options:
			-- list of tree-sitter node types to filter
			-- skips = { "string_content" },
			mapping = "<tab>",
		}
	},




	-- -- Navbuddy, use :Navbuddy to quickly jump to objects and functions in buffer
	-- Disabled because of breaking changes and not used anyway

	-- {
	-- 	"SmiteshP/nvim-navbuddy",
	-- 	dependencies = {
	-- 		"SmiteshP/nvim-navic",
	-- 		"MunifTanjim/nui.nvim"
	-- 	},
	-- 	opts = { lsp = { auto_attach = true } }
	-- },


	-- --Better file explorer, I to see help
	-- { 'tpope/vim-vinegar'},

	{ require("setup.oil") },

	-- leap to 2char sequence with s, or gs backwards.
	-- Two custom mappings nothing more, quite enough
	{ 'ggandor/leap.nvim',          init = require('setup.leap') },

	-- -- obsydian integration plugin
	-- { require('setup.obsydian') },

	-- table mode, :tableMode or <leader>tm to enter table.
	{ 'dhruvasagar/vim-table-mode', init = require('setup.vim_table_mode') },

	--{
	--	"iamcco/markdown-preview.nvim",
	--	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	--	ft = { "markdown" },
	--	build = function() vim.fn["mkdp#util#install"]() end,
	--	init = function()
	--		vim.g.mkdp_preview_options = {
	--			mkit = {
	--				breaks = true
	--			}
	--		}
	--	end,
	--},

}
