-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
      pickers = {
        colorscheme = {
          enable_preview = true
        }
      },
	defaults = {
		mappings = {
			i = {
				["<esc>"] = "close",
				["<C-j>"] = "move_selection_next",
				["<C-l>"] = "select_default",
				["<C-k>"] = "move_selection_previous",
				['<C-u>'] = "preview_scrolling_up",
				['<C-d>'] = "preview_scrolling_down",
			},
		},
	},
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = 'Find recently opened files' })



-- _b sortuje od najnowszych do najstarszych
vim.keymap.set('n', '<leader>b', function()
	require('telescope.builtin').buffers(
		{
			show_all_buffers = false,
			ignore_current_buffer = true,
			sort_lastused = true,
			sort_mru = true,
		}
	)
end, { desc = 'Find existing buffers' })

vim.keymap.set('n', '<leader>.', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })

vim.keymap.set('n', '<leader>j', require('telescope.builtin').jumplist, { desc = 'Find in jumplist' })

vim.keymap.set('n', '<leader>/', function()
	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>sg', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })

vim.keymap.set('n', '<leader>svi', function()
	require('telescope.builtin').find_files(
		{
			cwd = "~/.config/nvim/",
			search_dirs = {
				"~/.config/dotfiles/",
				"~/.config/nvim/",
				"~/programowanie/host/"
			},
			hidden = false,
		}
	)
end, { desc = '[S]earch [F]iles in n[VI]m config' })

vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
