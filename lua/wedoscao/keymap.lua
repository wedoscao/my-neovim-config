vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>P", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Terminal
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>`", vim.cmd.ToggleTerm)

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

-- Fugitive
vim.keymap.set("n", "<leader>gt", vim.cmd.Git)

-- Telescope
vim.keymap.set("n", "<leader>pf", require("telescope.builtin").find_files)
vim.keymap.set("n", "<leader>ps", function()
	require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>pr", function()
	require("telescope.builtin").diagnostics({
		bufnr = 0,
	})
end)

-- Workspaces
vim.keymap.set("n", "<leader>wa", vim.cmd.AddWorkspaces)
vim.keymap.set("n", "<leader>wad", vim.cmd.AddDirWorkspaces)
vim.keymap.set("n", "<leader>wo", vim.cmd.OpenWorkspaces)
vim.keymap.set("n", "<leader>wr", vim.cmd.RemoveWorkspaces)
vim.keymap.set("n", "<leader>wrd", vim.cmd.RemoveDirWorkspaces)
