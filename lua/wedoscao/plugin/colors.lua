local _set_colorscheme = vim.cmd.colorscheme

local function set_colorscheme(colorscheme)
    colorscheme = colorscheme or vim.g.default_colorscheme or "default"
    _set_colorscheme(colorscheme)
end

set_colorscheme()

local function set_colorscheme_ui()
    local Menu = require("nui.menu")

    local lines = {}
    table.insert(lines, Menu.item("default"))

    for _, colorscheme in ipairs(vim.fn.getcompletion("", "color")) do
        if colorscheme ~= "default" then
            table.insert(lines, Menu.item(colorscheme))
        end
    end

    local menu = Menu({
        position = "50%",
        size = {
            width = 60,
            height = 30,
        },
        border = {
            style = "single",
            text = {
                top = "[Choose-a-Colorscheme]",
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
            local colorscheme = nil
            if item ~= nil then
                if item.text ~= "default" then
                    colorscheme = item.text
                end
            end
            set_colorscheme(colorscheme)
        end,
    })

    menu:mount()
end

vim.api.nvim_create_user_command("Colorscheme", function()
    set_colorscheme_ui()
end, {})

vim.cmd.ca('colorscheme :lua print("Please use :Colorscheme")')
