return function(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end

		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	local ts_builtin = require('telescope.builtin')

	nmap('<leader>li', function()
		vim.cmd("checkhealth vim.lsp")
	end, 'LSP info')

	nmap('<leader>lr',  vim.lsp.buf.rename,      '[R]ename')
	nmap('<leader>lca', vim.lsp.buf.code_action, '[C]ode [A]ction')
	nmap('<leader>lf', function()
		vim.lsp.buf.format({ timeout_ms = 10000 })
	end, '[L]SP [F]ormat')

	nmap('gd',          vim.lsp.buf.definition,                   '[G]oto [D]efinition')
	nmap('gD',          vim.lsp.buf.declaration,                  '[G]oto [D]eclaration')

	nmap('gI',          vim.lsp.buf.implementation,               '[G]oto [I]mplementation')
	nmap('<leader>lT',  vim.lsp.buf.type_definition,              'Type [D]efinition')
	nmap('<leader>lD',  vim.lsp.buf.hover,                        'Hover Documentation')
	nmap('<C-k>',       vim.lsp.buf.hover,                        'Hover Documentation')
	nmap('<C-s>',       vim.lsp.buf.signature_help,               'Signature Documentation')

	nmap('gr',          ts_builtin.lsp_references,                '[G]oto [R]eferences')
	nmap('<leader>ld',  ts_builtin.lsp_document_symbols,          '[D]ocument Symbols')
	nmap('<leader>lWs', ts_builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

	nmap('<leader>lh', function()
			if (vim.diagnostic.is_disabled()) then
				vim.diagnostic.enable()
			else
				vim.diagnostic.disable()
			end
		end,
		'[L]SP [H]ide')

	nmap('<leader>lm', vim.diagnostic.open_float, '[L]SP float [M]essages')

	vim.diagnostic.config(
		{
			virtual_text = false,
			float = {
				source = true,
			}
		}
	)
end
