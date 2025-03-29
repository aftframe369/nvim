if vim.env.CHROMEBOOK == 1 then
	Chromebook = true
else
	Chromebook = false
end

M = {}

M.opts = {
	completion = {
		-- Set to false to disable completion.
		blink = true,
		nvim_cmp=false,
		min_chars = 0,
	},

	workspaces = {
		{
			name = "kisling",
			path = "~/Dokumenty/kisling/",
		},
	},

	attachments = {
		-- img_folder = "Załączniki", -- This is the default
		img_text_func = function(client, path)
			path = client:vault_relative_path(path) or path
			return string.format("![%s](%s)", path.name, path)
		end,
	},

	daily_notes = {
		folder = "Logi",
		alias_format = "%d %m %Y",
	},

	disable_frontmatter = true,

	mappings = {
		-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
		[""] = {
			action = function()
				return require("obsidian").util.gf_passthrough()
			end,
			opts = { noremap = false, expr = true, buffer = true },
		},
		-- Toggle check-boxes.
		["<leader>ch"] = {
			action = function()
				return require("obsidian").util.toggle_checkbox()
			end,
			opts = { buffer = true },
		},
		["<leader>."] = {
			action = function()
				vim.api.nvim_command(":ObsidianSearch")
			end,
			opts = { noremap = false, expr = false, buffer = true },
		},
		["<leader>q"] = {
			action = function()
				return vim.cmd(":ObsidianQuickSwitch")
			end,
			opts = { noremap = false, expr = false, buffer = true },
		},

	},
	note_id_func = function(title)
		return title
	end,

	ui = {
		enable = true,    -- set to false to disable all additional syntax features
		update_debounce = 200, -- update delay after a text change (in milliseconds)
		checkboxes = {
			[" "] = { hl_group = "ObsidianTodo" },
			["x"] = { hl_group = "ObsidianDone" },
			[">"] = { hl_group = "ObsidianRightArrow" },
			["~"] = { hl_group = "ObsidianTilde" },

		},
		reference_text = { hl_group = "ObsidianRefText" },
		highlight_text = { hl_group = "ObsidianHighlightText" },
		tags = { hl_group = "ObsidianTag" },
		hl_groups = {
			-- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
			ObsidianTodo = { bold = true, fg = "#f78c6c" },
			ObsidianDone = { bold = true, fg = "#89ddff" },
			ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
			ObsidianTilde = { bold = true, fg = "#ff5370" },
			ObsidianBullet = { bold = true, fg = "#89ddff" },
			ObsidianRefText = { underline = true, fg = "#c792ea" },
			ObsidianExtLinkIcon = { fg = "#c792ea" },
			ObsidianTag = { italic = true, fg = "#89ddff" },
			ObsidianHighlightText = { bg = "#75662e" },
		},
	},

	templates = {
		substitutions = {
			date = function()
				return os.date("%d %M %Y", os.time())
			end
		},
	},

}

M.init = function()
	vim.api.nvim_create_user_command("Obsydian", ':e  ~/Dokumenty/kisling/',
		{ desc = 'open obsidian notes directory' })
	vim.api.nvim_create_user_command("ObsydianUlubiona",
		":!ln -s \"%:p\" \"/home/maciej/Dokumenty/kisling/00 ulubione/%:t\"", {})
	vim.api.nvim_create_user_command("ObsydianToday",
		':cd ~/Dokumenty/kisling| e TODO.md | ObsidianToday',
		{ desc = "Todays note" })
end


return M
