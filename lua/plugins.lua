return {
	--formatter, DAP, Linter support for Mason
	{ 'mhartington/formatter.nvim', },
	{ 'mfussenegger/nvim-dap', },
	{ 'mfussenegger/nvim-dap-python', },
	{ 'mfussenegger/nvim-lint', },
	{ 'nvimtools/none-ls.nvim' },

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

	-- surround word/selection in brackets, quotes etc.
	-- Added better custom mappings
	-- S mnemonic to surround
	-- Si) to sourround with () in something
	-- Sd) to delete surrounding ()
	-- Sc)] to change surrounding () to []
	{ 'tpope/vim-surround',           init = require('setup.surround') },

	-- -- autopair brackets and quotes
	-- { 'jiangmiao/auto-pairs', },
	--
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = { require 'setup.autopairs' }
	},

	-- color picker r -> HSL/rgb switch
	{ 'ziontee113/color-picker.nvim', opts = {} },

	-- java server
	{ 'mfussenegger/nvim-jdtls' },

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

	-- Navbuddy, use :Navbuddy to quickly jump to objects and functions in buffer
	{
		"SmiteshP/nvim-navbuddy",
		dependencies = {
			"SmiteshP/nvim-navic",
			"MunifTanjim/nui.nvim"
		},
		opts = { lsp = { auto_attach = true } }
	},

	-- --Better file explorer, I to see help
	-- { 'tpope/vim-vinegar'},

	{
		'stevearc/oil.nvim',
		opts = {
			skip_confirm_for_simple_edits = false,
			signcolumn = "yes",
			columns = {
				"icon",
			},
		},
	},

	-- leap to 2char sequence with s, or gs backwards.
	-- Two custom mappings nothing more, quite enough
	{ 'ggandor/leap.nvim',          init = require('setup.leap') },

	{ require('setup.obsydian') },

	-- table mode, :tableMode or <leader>tm to enter table.
	{ 'dhruvasagar/vim-table-mode', init = require('setup.vim_table_mode') },

	-- install without yarn or npm
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
		init = function()
			vim.g.mkdp_preview_options = {
				mkit = {
					breaks = true
				}
			}
		end,
	}
}
