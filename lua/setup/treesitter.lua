-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
local ts = require('nvim-treesitter')

ts.setup()

ts.install({
	'bash',
	'c', 'cpp',
	'html',
	'java',
	"javascript",
	'lua',
	'markdown', 'markdown_inline',
	'python',
	'sql',
	'vimdoc', 'vim'
}
)

local to = require('nvim-treesitter-textobjects')

to.setup({
	select = {
		-- Automatically jump forward to textobj, similar to targets.vim
		lookahead = true,
		selection_modes = {
			['@parameter.outer'] = 'v', -- charwise
			['@function.outer'] = 'V', -- linewise
			-- ['@class.outer'] = '<c-v>', -- blockwise
		},
		-- If you set this to `true` (default is `false`) then any textobject is
		-- extended to include preceding or succeeding whitespace. Succeeding
		-- whitespace has priority in order to act similarly to eg the built-in
		-- `ap`.
		include_surrounding_whitespace = false,
	},
})

local map = vim.keymap.set
local select_to = require "nvim-treesitter-textobjects.select".select_textobject
local swap_to = require "nvim-treesitter-textobjects.swap"
local move_to = require("nvim-treesitter-textobjects.move")

-- keymaps
-- You can use the capture groups defined in `textobjects.scm`
map({ "x", "o" }, "am", function()
	select_to("@function.outer", "textobjects")
end)
map({ "x", "o" }, "im", function()
	select_to("@function.inner", "textobjects")
end)
map({ "x", "o" }, "ac", function()
	select_to("@class.outer", "textobjects")
end)
map({ "x", "o" }, "ic", function()
	select_to("@class.inner", "textobjects")
end)
-- You can also use captures from other query groups like `locals.scm`
map({ "x", "o" }, "as", function()
	select_to("@local.scope", "locals")
end)

-- keymaps
map("n", "<leader>a", function()
	swap_to.swap_next "@parameter.inner"
end)
map("n", "<leader>A", function()
	swap_to.swap_previous "@parameter.outer"
end)

-- keymaps
-- You can use the capture groups defined in `textobjects.scm`

map({ "n", "x", "o" }, "]m", function()
	move_to.goto_next_start("@function.outer", "textobjects")
end, { desc = "go to next function start" })
map({ "n", "x", "o" }, "]M", function()
	move_to.goto_next_end("@function.outer", "textobjects")
end, { desc = "go to next function end" })
map({ "n", "x", "o" }, "[m", function()
	move_to.goto_previous_start("@function.outer", "textobjects")
end, { desc = "go to previous function start" })
map({ "n", "x", "o" }, "[M", function()
	move_to.goto_previous_end("@function.outer", "textobjects")
end, { desc = "go to previous function end" })

-- map({ "n", "x", "o" }, "", function()
--   move_to.goto_next_start("@class.outer", "textobjects")
-- end)

-- You can also pass a list to group multiple queries.
map({ "n", "x", "o" }, "]l", function()
	move_to.goto_next_start({ "@loop.inner", "@loop.outer" }, "textobjects")
end, { desc = "go to next loop start/end" })
map({ "n", "x", "o" }, "[l", function()
	move_to.goto_previous_start({ "@loop.inner", "@loop.outer" }, "textobjects")
end, { desc = "go to previous loop start/end" })

-- You can also use captures from other query groups like `locals.scm` or `folds.scm`
map({ "n", "x", "o" }, "]s", function()
	move_to.goto_next_start("@local.scope", "locals")
end, { desc = "go to next scope" })

-- Go to either the start or the end, whichever is closer.
-- Use if you want more granular movements
map({ "n", "x", "o" }, "]i", function()
	move_to.goto_next_start("@conditional.inner", "textobjects")
end)
map({ "n", "x", "o" }, "[i", function()
	move_to.goto_previous_start("@conditional.inner", "textobjects")
end)
