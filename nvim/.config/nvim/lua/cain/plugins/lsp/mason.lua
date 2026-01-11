return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        -- Disable automatic setup - we explicitly configure servers in servers.lua
        -- This allows machine-specific LSP configurations
        automatic_installation = false,
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
