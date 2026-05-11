M = {}
M.color = function(brightness)
	-- vim.o.background = 'light'
	-- vim.o.background = 'dark'
	vim.o.background = brightness
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" }) --normal not active
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "" }) -- floating bg = none
	vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
	vim.api.nvim_set_hl(0, "Visual", { bg = "MistyRose", fg = "black" })
	vim.api.nvim_set_hl(0, "CursorLine", { bg = "none", underline = true, sp = 'none' })
	if brightness == "light" then
		vim.api.nvim_set_hl(0, "CursorLine", { bg = "white", underline = false, sp = 'none' })
	end
end

return M

