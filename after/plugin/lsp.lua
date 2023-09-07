local lspconfig = require("lspconfig")
require("neodev").setup({})
require("mason").setup()
local mason_lsp = require("mason-lspconfig")

mason_lsp.setup({
    ensure_installed = {
        "rust_analyzer",
        "lua_ls",
        "tsserver",
        "tailwindcss",
        "jsonls",
        "cssls",
        "taplo",
        "html",
        "marksman",
        "sqlls",
        "vimls",
        "yamlls",
        "bashls",
        "emmet_language_server",
        "clangd",
    },
})

mason_lsp.setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({})
    end,
    ["rust_analyzer"] = function()
        require("rust-tools").setup({
            server = {
                settings = {
                    ["rust-analyzer"] = {
                        checkOnSave = true,
                        check = {
                            command = "clippy",
                            features = "all",
                        },
                    },
                },
            },
        })
    end,
})
