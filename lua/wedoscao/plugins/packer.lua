local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local is_genesis = ensure_packer()

require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- Colorscheme
    use("Mofiqul/dracula.nvim")
    use("folke/tokyonight.nvim")
    use("rebelot/kanagawa.nvim")
    use({ "catppuccin/nvim", as = "catppuccin" })
    use("EdenEast/nightfox.nvim")

    use({ "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { "nvim-lua/plenary.nvim" } })
    use({
        "nvim-treesitter/nvim-treesitter",
        "HiPhish/nvim-ts-rainbow2",
        "nvim-treesitter/nvim-treesitter-context",
        "windwp/nvim-ts-autotag",
        "nvim-treesitter/nvim-treesitter-refactor",
        "nvim-treesitter/playground",
    })
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use("williamboman/mason.nvim")
    use({
        "jose-elias-alvarez/null-ls.nvim",
        "jay-babu/mason-null-ls.nvim",
    })
    use({
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    })
    use({
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",
    })
    use("simrat39/rust-tools.nvim")
    use("windwp/nvim-autopairs")
    use("numToStr/Comment.nvim")
    use("MunifTanjim/nui.nvim")
    use("folke/neodev.nvim")
    use("nvim-tree/nvim-web-devicons")
    use({ "nvimdev/dashboard-nvim", requires = { "nvim-tree/nvim-web-devicons" } })
    use("xiyaowong/transparent.nvim")
    use("akinsho/toggleterm.nvim")
    use("natecraddock/workspaces.nvim")
end)

if is_genesis then
    vim.cmd("PackerSync")
end