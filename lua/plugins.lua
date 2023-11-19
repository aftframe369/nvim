return {
	--formatter, DAP, Linter support for Mason
	{ 'mhartington/formatter.nvim', },
	{ 'mfussenegger/nvim-dap', },
	{ 'mfussenegger/nvim-dap-python', },
	{ 'mfussenegger/nvim-lint', },
	{ 'jose-elias-alvarez/null-ls.nvim' },

	-- surround word/selection in brackets, quotes etc.
	-- csXY - change surrounding from x to y
	-- dsX - delete surrounding X
	-- ysiw - use surround in word (very bad map tbh)
	-- Sx - surround with x in visual mode
	{ 'tpope/vim-surround', init = require( 'setup.surround' ) },

	-- autopair brackets and quotes
	{ 'jiangmiao/auto-pairs', },

	-- color picker r -> HSL/rgb switch
	{ 'ziontee113/color-picker.nvim',   opts = {} },

	-- java server
	{ 'mfussenegger/nvim-jdtls' },

	-- Useful plugin to show you pending keybinds.
	{ 'folke/which-key.nvim',           opts = {} },

	-- Add indentation guides even on blank lines
	{  require 'setup.blanklines' },
    
	--use tab to escape from brackets
	{
		'boltlessengineer/smart-tab.nvim',
		opts = {
			-- default options:
			-- list of tree-sitter node types to filter
			skips = { "string_content" },
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

	-- Some of the behaviors added by vinegar.vim would make excellent upstream additions. Many, the author would probably reject. Others are a bit too wild to even consider.
	-- Press - in any buffer to hop up to the directory listing and seek to the file you just came from. Keep bouncing to go up, up, up. 
	-- All that annoying crap at the top is turned off. Press I to toggle until you adapt.
	-- The oddly C-biased default sort order is replaced with a sensible application of 'suffixes'.
	-- If you put let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+' in your vimrc, vinegar will initialize with dot files hidden. Press gh to toggle dot file hiding.
	-- Press . on a file to pre-populate it at the end of a : command line. This is great, for example, to quickly initiate a :grep of the file or directory under the cursor. Type .!chmod +x and get :!chmod +x path/to/file.
	-- Press y. to yank an absolute path for the file under the cursor.
	-- Press ~ to go home.
	{ 'tpope/vim-vinegar' },
}
