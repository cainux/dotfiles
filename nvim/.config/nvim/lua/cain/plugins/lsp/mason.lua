return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            "lua_ls",

            -- my day job
            "csharp_ls",
            "terraformls",
            "tflint",
            "dockerls",
            "docker_compose_language_service",
            "bashls",
            "jsonls",
            "protols",

            -- bit of fun
            "svelte",
            "ts_ls",
            "cssls",
            "rust_analyzer",
            "sqlls",
            "eslint",
            "powershell_es",
            "html",
        }
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
