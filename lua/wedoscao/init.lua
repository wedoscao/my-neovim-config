require("wedoscao.config")
require("wedoscao.keymap")
require("wedoscao.plugins")

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("TransparentEnable")
		if vim.fn.argc() == 0 then
			vim.cmd("Dashboard")
		end

		local workspaces = require("workspaces")
		workspaces.sync_dirs()
		local has_nvim = false
		for _, workspace in ipairs(workspaces.get()) do
			if workspace == "nvim" then
				has_nvim = true
			end
		end
		if not has_nvim then
			workspaces.add(vim.fn.expand("~/.config/nvim"), "nvim")
		end
		workspaces.open("nvim")
	end,
})
