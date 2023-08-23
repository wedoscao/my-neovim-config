local workspaces = require("workspaces")

local function open_workspaces()
	local Menu = require("nui.menu")

	vim.cmd("WorkspacesSyncDirs")

	local lines = {}

	for _, v in ipairs(workspaces.get()) do
		table.insert(lines, Menu.item(v.name))
	end

	local menu = Menu({
		position = "50%",
		size = {
			width = 50,
			height = 10,
		},
		border = {
			style = "single",
			text = {
				top = "[Choose-a-Workspace]",
				top_align = "center",
			},
		},
		win_options = {
			winhighlight = "Normal:Normal,FloatBorder:Normal",
		},
	}, {
		lines = lines,
		max_width = 20,
		keymap = {
			focus_next = { "j", "<Down>", "<Tab>" },
			focus_prev = { "k", "<Up>", "<S-Tab>" },
			close = { "<Esc>", "<C-c>" },
			submit = { "<CR>", "<Space>" },
		},
		on_close = function()
			print("Workspace Menu Closed")
		end,
		on_submit = function(item)
			if item ~= nil then
				local name = item.text
				workspaces.open(name)
			else
				print("Invalid item")
			end
		end,
	})

	menu:mount()
end

local function remove_workspace()
	local Menu = require("nui.menu")

	vim.cmd("WorkspacesSyncDirs")

	local lines = {}

	for _, v in ipairs(workspaces.get()) do
		table.insert(lines, Menu.item(v.name))
	end

	local menu = Menu({
		position = "50%",
		size = {
			width = 50,
			height = 10,
		},
		border = {
			style = "single",
			text = {
				top = "[Choose-a-Workspace]",
				top_align = "center",
			},
		},
		win_options = {
			winhighlight = "Normal:Normal,FloatBorder:Normal",
		},
	}, {
		lines = lines,
		max_width = 20,
		keymap = {
			focus_next = { "j", "<Down>", "<Tab>" },
			focus_prev = { "k", "<Up>", "<S-Tab>" },
			close = { "<Esc>", "<C-c>" },
			submit = { "<CR>", "<Space>" },
		},
		on_close = function()
			print("Workspace Menu Closed")
		end,
		on_submit = function(item)
			if item ~= nil then
				local name = item.text
				workspaces.remove(name)
			else
				print("Invalid item")
			end
		end,
	})

	menu:mount()
end

local function add_workspaces()
	local Input = require("nui.input")
	local event = require("nui.utils.autocmd").event

	local input = Input({
		position = "50%",
		size = {
			width = 20,
		},
		border = {
			style = "single",
			text = {
				top = "[Name]",
				top_align = "center",
			},
		},
		win_options = {
			winhighlight = "Normal:Normal,FloatBorder:Normal",
		},
	}, {
		prompt = "> ",
		default_value = "",
		on_close = function()
			print("Input Closed!")
		end,
		on_submit = function(name)
			if name ~= "" then
				local _Input = require("nui.input")
				local _event = require("nui.utils.autocmd").event

				local input = _Input({
					position = "50%",
					size = {
						width = 20,
					},
					border = {
						style = "single",
						text = {
							top = "[Path]",
							top_align = "center",
						},
					},
					win_options = {
						winhighlight = "Normal:Normal,FloatBorder:Normal",
					},
				}, {
					prompt = "> ",
					default_value = "",
					on_close = function()
						print("Input Closed!")
					end,
					on_submit = function(path)
						if path ~= "" then
							workspaces.add(vim.fn.expand(path), name)
						else
							print("Invalid path")
						end
					end,
				})

				-- mount/open the component
				input:mount()

				-- unmount component when cursor leaves buffer
				input:on(_event.BufLeave, function()
					input:unmount()
				end)
			else
				print("Invalid name")
			end
		end,
	})

	-- mount/open the component
	input:mount()

	-- unmount component when cursor leaves buffer
	input:on(event.BufLeave, function()
		input:unmount()
	end)
end

local function add_dir_workspaces()
	local Input = require("nui.input")
	local event = require("nui.utils.autocmd").event

	local input = Input({
		position = "50%",
		size = {
			width = 20,
		},
		border = {
			style = "single",
			text = {
				top = "[Path]",
				top_align = "center",
			},
		},
		win_options = {
			winhighlight = "Normal:Normal,FloatBorder:Normal",
		},
	}, {
		prompt = "> ",
		default_value = "",
		on_close = function()
			print("Input Closed!")
		end,
		on_submit = function(path)
			if path ~= "" then
				require("workspaces").add_dir(vim.fn.expand(path))
			else
				print("Invalid path")
			end
		end,
	})

	-- mount/open the component
	input:mount()

	-- unmount component when cursor leaves buffer
	input:on(event.BufLeave, function()
		input:unmount()
	end)
end

local function remove_dir_workspaces()
	local Input = require("nui.input")
	local event = require("nui.utils.autocmd").event

	local input = Input({
		position = "50%",
		size = {
			width = 20,
		},
		border = {
			style = "single",
			text = {
				top = "[Name]",
				top_align = "center",
			},
		},
		win_options = {
			winhighlight = "Normal:Normal,FloatBorder:Normal",
		},
	}, {
		prompt = "> ",
		default_value = "",
		on_close = function()
			print("Input Closed!")
		end,
		on_submit = function(name)
			if name ~= "" then
				workspaces.remove_dir(name)
			else
				print("Invalid name")
			end
		end,
	})

	-- mount/open the component
	input:mount()

	-- unmount component when cursor leaves buffer
	input:on(event.BufLeave, function()
		input:unmount()
	end)
end

vim.api.nvim_create_user_command("OpenWorkspaces", open_workspaces, {})
vim.api.nvim_create_user_command("RemoveWorkspaces", remove_workspace, {})
vim.api.nvim_create_user_command("AddWorkspaces", add_workspaces, {})
vim.api.nvim_create_user_command("AddDirWorkspaces", add_dir_workspaces, {})
vim.api.nvim_create_user_command("RemoveDirWorkspaces", remove_dir_workspaces, {})
