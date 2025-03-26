local M = {}

M.deps = {
	"rafamadriz/friendly-snippets",
}

M.opts = {
	-- See :h blink-cmp-config-keymap for defining your own keymap
	keymap = {
		preset = 'none',
		['K'] = { 'select_prev', 'fallback' },
		['J'] = { 'select_next', 'fallback' },
		['L'] = { 'accept', 'fallback' },
		['<C-j>'] = { 'snippet_forward', 'fallback' },
		['<C-k>'] = { 'show_documentation', "hide_documentation", 'snippet_backward', 'fallback' },
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

		['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
		['<C-d>'] = { 'scroll_documentation_down', 'fallback' },

		['<C-H>'] = { function(cmp) cmp.show({ providers = { 'snippets' } }) end },
		['<C-x>'] = { function(cmp) cmp.show({ providers = { 'path' } }) end, 'fallback' }
	},
	appearance = {
		nerd_font_variant = '',
		use_nvim_cmp_as_default = true,
		kind_icons = {
			Text = '☰',
			Method = 'm()',
			Function = 'f()',
			Constructor = 'constructor',

			Field = 'field',
			Variable = 'x=',
			Property = 'prop',

			Class = 'cl',
			Interface = 'inter ',
			Struct = 'struct',
			Module = '{}',

			Unit = 'μ',
			Value = 'val',
			Enum = 'en',
			EnumMember = 'en',

			Keyword = 'id',
			Constant = 'const',

			Snippet = '☰x☰',
			Color = 'rgb',
			File = 'file',
			Reference = 'ref',
			Folder = '/',
			Event = 'event',
			Operator = 'oper',
			TypeParameter = 'type',
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
			window = { border = 'single' },
		},

		trigger = {
			show_on_trigger_character = true,
		}

	},

	sources = {
		default = { 'lsp', 'path', 'snippets' },
		per_filetype = {
			markdown = { "buffer" },
		},
		providers = {}
	},
	fuzzy = { implementation = "prefer_rust_with_warning" }
}

M.init = function()
end

return M
