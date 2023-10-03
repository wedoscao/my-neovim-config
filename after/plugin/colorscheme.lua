function SetColorscheme(colorscheme)
	vim.cmd.colorscheme(colorscheme or vim.g.default_colorscheme or "default")
	vim.cmd("TransparentEnable")
end

SetColorscheme()
