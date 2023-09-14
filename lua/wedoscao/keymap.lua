-- Ex
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Enhanced move
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Tab multiple lines
vim.keymap.set("v", "<tab>", function()
	vim.cmd(">")
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>P", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Terminal
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")

-- Colorscheme
vim.keymap.set("n", "<leader>co", vim.cmd.Colorscheme)

-- Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Lsp
vim.keymap.set("n", "<leader>.", function()
	vim.lsp.buf.code_action()
end)
vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.hover()
end)
vim.keymap.set("n", "<leader>r", function()
	local opts = {
		focusable = false,
		close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
		border = "rounded",
		source = "always",
		prefix = " ",
		scope = "cursor",
	}
	vim.diagnostic.open_float(nil, opts)
end)

-- Fugitive
vim.keymap.set("n", "<leader>gt", vim.cmd.Git)

-- Telescope
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

-- Workspaces
vim.keymap.set("n", "<leader>wa", vim.cmd.AddWorkspaces)
vim.keymap.set("n", "<leader>wad", vim.cmd.AddDirWorkspaces)
vim.keymap.set("n", "<leader>wo", vim.cmd.OpenWorkspaces)
vim.keymap.set("n", "<leader>wr", vim.cmd.RemoveWorkspaces)
vim.keymap.set("n", "<leader>wrd", vim.cmd.RemoveDirWorkspaces)
