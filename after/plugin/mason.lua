require("mason").setup()
require("mason-update-all").setup()
local lspconfig = require("lspconfig")
require("neodev").setup({})
local null_ls = require("null-ls")
local mason_lsp = require("mason-lspconfig")
local mason_null_ls = require("mason-null-ls")

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

mason_null_ls.setup({
    ensure_installed = { "stylua", "prettierd", "sql-formatter", "rustfmt", "beautysh", "clang-format" },
    automatic_installation = false,
    handlers = {},
})

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettierd.with({
            env = {
                PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.config/nvim/utils/.prettierrc.json"),
            },
        }),
    },
    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                    vim.lsp.buf.format({ async = false })
                end,
            })
        end
    end,
})
