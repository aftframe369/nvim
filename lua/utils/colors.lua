M = {}

M.basic_highlights = function()
	vim.api.nvim_set_hl(0, "Normal",   { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
	vim.api.nvim_set_hl(0, "debugPC",  { link = "CursorColumn" })

	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "" }) -- floating bg = none
	vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "Visual", { bg = "MistyRose", fg = "black" })
	vim.api.nvim_set_hl(0, "CursorLine",      { bg = "none", underline = true, sp = 'none' })
end

M.brightness = function(color)
	if color == "light" then
		vim.cmd.colorscheme 'melange'
	end
	vim.o.background = color;
	M.basic_highlights();
end

M.color = function()
	if (vim.g.TERM_BRIGHTNESS == "LIGHT") then
		M.brightness("light")
	else
		M.brightness("dark")
	end
end


return M
