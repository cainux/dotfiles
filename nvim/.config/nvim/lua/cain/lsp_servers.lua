-- Single source of truth for LSP servers used across machines.
-- Keys are lspconfig server names (also what mason-lspconfig accepts in
-- `ensure_installed`); values are per-server opts passed to vim.lsp.config().
return {
    protols = {
        init_options = {
            include_paths = {
                vim.fn.expand("~/shared-protos"),
                ".",
            },
        },
    },
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = { globals = { "vim" } },
            },
        },
    },
    rust_analyzer = {
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = { command = "clippy" },
            },
        },
    },
    csharp_ls = {},
    tofu_ls = {},
    tflint = {},
    dockerls = {},
    bashls = {},
    jsonls = {},
    svelte = {},
    ts_ls = {},
    cssls = {},
    sqlls = {},
    eslint = {},
    powershell_es = {},
    html = {},
}
