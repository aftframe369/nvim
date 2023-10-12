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
	{ 'tpope/vim-surround' },

	-- autopair brackets and quotes
	{ 'jiangmiao/auto-pairs', },

	-- color picker r -> HSL/rgb switch
	{ 'ziontee113/color-picker.nvim',   opts = {} },

	-- java server
	{ 'mfussenegger/nvim-jdtls' },
}
