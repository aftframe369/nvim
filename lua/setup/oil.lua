return {
	opts = {

		skip_confirm_for_simple_edits = true,
		signcolumn = "yes",
		watch_for_changes = true,

		columns = {
			"icon",
		},

		keymaps = {
			["yp"] = "actions.yank_entry",
			["yln"] = function() 
				-- moja własna implementacja symlinków
				-- nie dodawaj symlinków o takeij samej nazweie 
				-- w folderze pliku właściwego!
				local dir = require("oil").get_current_dir()
				local fn = require("oil").get_cursor_entry().name
				local entry_path = dir..fn
				local link_string = fn .. " -> " .. entry_path

				--"l" jako pełna linia
				vim.fn.setreg(vim.v.register, link_string, "l")
				end
			},
		}
	}
