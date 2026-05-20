-- LSP server configurations for Neovim 0.11+ (vim.lsp.config / vim.lsp.enable).
-- Each server is enabled unconditionally; if the binary is missing on this
-- machine, Neovim simply won't start it. No silent pcall needed.

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
        local capabilities = ok and cmp_nvim_lsp.default_capabilities()
            or vim.lsp.protocol.make_client_capabilities()

        -- Apply cmp capabilities to every server registered via vim.lsp.config.
        vim.lsp.config("*", { capabilities = capabilities })

        local servers = require("cain.lsp_servers")
        for name, opts in pairs(servers) do
            if next(opts) ~= nil then
                vim.lsp.config(name, opts)
            end
            vim.lsp.enable(name)
        end
    end,
}
