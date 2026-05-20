return {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    opts = function()
        local servers = require("cain.lsp_servers")
        local ensure_installed = vim.tbl_keys(servers)
        return {
            ensure_installed = ensure_installed,
            -- We enable servers explicitly in servers.lua, so don't double-enable.
            automatic_enable = false,
        }
    end,
}
