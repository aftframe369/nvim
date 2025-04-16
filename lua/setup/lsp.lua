-- LSP settings.
local on_attach = require('setup.lsp_onattach')

local servers = {
	pyright = {},

	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
}

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
	ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
	function(server_name)
		require('lspconfig')[server_name].setup {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
		}
	end,
};

require 'lspconfig'.pyright.setup({
	on_attach = on_attach,
	settings = {
		pyright = { autoImportCompletion = true, },
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = 'openFilesOnly',
				useLibraryCodeForTypes = true,
				typeCheckingMode = 'on'
			}
		}
	}
})

require 'lspconfig'.emmet_ls.setup({
	-- on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
	init_options = {
		html = {
			options = {
				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
				["bem.enabled"] = true,
			},
		},
	}
})

local null_ls = require("null-ls")

null_ls.setup({
	on_attach = on_attach,
	sources = {
		-- null_ls.builtins.diagnostics.mypy,

		null_ls.builtins.formatting.prettier.with({
			filetypes = { "markdown", "yaml" }
		}),

		null_ls.builtins.formatting.clang_format.with({
			extra_args = { "-style=", "{IndentWidth: 4}" }
		}),

		null_ls.builtins.formatting.sqlfluff.with({
			extra_args = { "--dialect", "mariadb" }
		}),


	},
})

require("none-ls-autoload").setup({
	external_sources = {
		'none-ls-external-sources.formatting.autopep8',
	}
})
