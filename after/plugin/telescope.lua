local telescope = require("telescope")
telescope.load_extension("workspaces")
local telescope_builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", require("telescope.builtin").find_files)
vim.keymap.set("n", "<leader>ps", function()
	telescope_builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>pr", function()
	telescope_builtin.diagnostics({
		bufnr = 0,
	})
end)
