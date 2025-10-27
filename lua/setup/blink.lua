local M = {}
M.deps = {
	"rafamadriz/friendly-snippets",
}

M.opts = {
	-- See :h blink-cmp-config-keymap for defining your own keymap
	keymap = {
		preset = 'none',
		['<C-k>'] = { 'select_prev', 'snippet_backward', 'fallback' },
		['<C-j>'] = { 'select_next', 'snippet_forward', 'fallback' },
		['<C-l>'] = { 'accept', 'fallback' },
		['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
		['<C-d>'] = { 'show_documentation', "scroll_documentation_down", 'fallback' },

		['<c-y>'] = { 'select_and_accept', 'fallback' },
		['<C-CR>'] = { 'select_and_accept', 'fallback' },
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


		['<C-H>'] = { function(cmp) cmp.show({ providers = { 'snippets' } }) end },
		['<C-x>'] = { function(cmp) cmp.show({ providers = { 'path' } }) end, 'fallback' }
	},

	appearance = {
		nerd_font_variant = '',
		use_nvim_cmp_as_default = true,
		kind_icons = {
			Text = '§',
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

			Snippet = '§x§',
			Color = 'rgb',
			File = 'file',
			Reference = 'ref',
			Folder = '/',
			Event = 'event',
			Operator = 'oper',
			TypeParameter = 'type',
		},
	},
	cmdline = {
		keymap = {
			['<C-k>'] = { 'select_prev', 'fallback' },
			['<C-j>'] = { 'select_next', 'fallback' },
			['<C-l>'] = { 'accept', 'fallback' },
			['<C-CR>'] = { 'select_and_accept', 'fallback' },
			['<CR>'] = { 'accept_and_enter', 'fallback' },
		}
	},

	completion = {
		menu = {
			draw = {
				columns = { { "kind_icon" }, { "label" } },
				treesitter = { 'lsp', 'path', 'snippets' },
			},
		},

		ghost_text = {
			enabled = function() return 
				vim.bo.filetype == 'html' or
				vim.bo.filetype == 'htmldjango' or
				vim.bo.filetype == 'css'
				end,
			show_without_selection = true,
			show_without_menu = true,
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
			markdown = { "buffer", "snippets" },
			sh = { "buffer" },
			lua = { "lazydev", 'lsp', 'path', 'snippets' },
			sql = { "buffer" },
			html = { "buffer", "lsp", "snippets" }
		},
		providers = {
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				-- make lazydev completions top priority (see `:h blink.cmp`)
				score_offset = 100,
			},
		}

	},
	fuzzy = { implementation = "prefer_rust_with_warning" }

}

M.init = function()
end

return M
