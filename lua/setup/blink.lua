local M = {}

M.deps = {
	"rafamadriz/friendly-snippets",
	'honza/vim-snippets',
	'SirVer/ultisnips',
}

M.opts = {
	-- See :h blink-cmp-config-keymap for defining your own keymap
	keymap = {
		preset = 'none',
		['K'] = { 'select_prev', 'fallback' },
		['J'] = { 'select_next', 'fallback' },
		['L'] = { 'accept', 'fallback' },
		['<C-j>'] = { 'snippet_forward', 'fallback' },
		['<C-k>'] = { 'snippet_backward', 'fallback' },
		['<CR>'] = { 'select_and_accept', 'fallback' },
		['<Esc>'] = {
			function(cmp)
				if cmp.cancel() then
					vim.schedule(function()
						vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<ESC>', true, false, true), 'n', true)
					end)
					return true
				end
			end
			, 'fallback' },

		['<C-K>'] = { 'show_documentation', "hide_documentation", 'fallback' },
		['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
		['<C-d>'] = { 'scroll_documentation_down', 'fallback' },

		['<C-H>'] = { function(cmp) cmp.show({ providers = { 'snippets' } }) end },
		['<C-x>'] = { function(cmp) cmp.show({ providers = { 'path' } }) end, 'fallback' }
	},

	appearance = {
		nerd_font_variant = 'mono',
		use_nvim_cmp_as_default = true,
		kind_icons = {
			Text = 't',
			Method = 'f',
			Function = 'f',
			Constructor = 'constructor',

			Field = 'f',
			Variable = 'v',
			Property = 'p',

			Class = 'cl',
			Interface = 'inter ',
			Struct = 'struct',
			Module = '{}',

			Unit = 'u',
			Value = '',
			Enum = '',
			EnumMember = '',

			Keyword = 'id',
			Constant = 'cons',

			Snippet = 's',
			Color = 'c',
			File = 'f',
			Reference = 'r',
			Folder = '/',
			Event = '',
			Operator = '',
			TypeParameter = 't',
		},
	},

	completion = {
		menu = {
			draw = {
				columns = { { "kind_icon" }, { "label" } },
				treesitter = { 'lsp', 'path', 'snippets' },
			},
		},

		documentation = {
			auto_show = false,
		},

	},

	sources = {
		default = { 'lsp', 'path', 'snippets', 'ultisnips' },
		providers = {
			ultisnips = {
				name = "ultisnips",
				module = 'blink.compat.source',
				score_offset = -3
			}
		}
	},

	fuzzy = { implementation = "prefer_rust_with_warning" }
}


return M
