local dashboard = require("dashboard")
dashboard.setup({
	theme = "hyper",
	config = {
		week_header = {
			enable = true,
		},
		shortcut = {
			{
				desc = "󰊳 Sync",
				group = "@property",
				action = function()
					vim.cmd("PackerSync")
					vim.cmd("MasonUpdateAll")
					vim.cmd("TSUpdate")
				end,
				key = "u",
			},
			{
				icon = " ",
				icon_hl = "@variable",
				desc = "Workspaces",
				group = "Label",
				action = "OpenWorkspaces",
				key = "p",
			},
			{
				desc = " File",
				group = "DiagnosticHint",
				action = function()
					require("telescope.builtin").find_files()
				end,
				key = "f",
			},
		},
		package = { enable = true },
		project = { enable = false },
		mru = { limit = 18, lable = "" },
	},
})

if vim.fn.argc() == 0 then
	vim.cmd("Dashboard")
end
