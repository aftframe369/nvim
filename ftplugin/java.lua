local on_attach = require('setup.lsp_onattach')
print(on_attach)
local config = {
	cmd = { '/home/maciej/.config/nvim/packages/jdtls/bin/jdtls' },
	root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
	settings = {
		java = {
			format = {
				enabled = true,
				insertSpaces = true,
			},
		}
	},
	on_attach = on_attach,
}
require('jdtls').start_or_attach(config)



vim.keymap.set({ 'n', 'i', 'v' }, '<F5>', '<Esc>:w<CR>:! javac "%"; java % <CR>')
--
--save, run script, open in new terminal in split window
vim.keymap.set({ 'n', 'i', 'v' }, '<F6>', ':w<CR>:tabnew %<CR>:term javac "%"; java % <CR>')
