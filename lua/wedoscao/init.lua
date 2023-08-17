require("wedoscao.config")
require("wedoscao.keymap")
require("wedoscao.plugins")

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("TransparentEnable")
		vim.cmd("MasonUpdate")
		vim.cmd("TSUpdate")
		vim.cmd("Dashboard")

		local workspaces = require("workspaces")
		local has_nvim = false
		for _, workspace in ipairs(workspaces.get()) do
			if workspace == "nvim" then
				has_nvim = true
			end
		end
		if not has_nvim then
			workspaces.add("nvim", vim.fn.expand("~/.config/nvim"))
		end
		workspaces.open("nvim")
	end,
})
