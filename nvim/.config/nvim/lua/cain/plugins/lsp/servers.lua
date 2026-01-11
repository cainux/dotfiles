-- LSP server configurations
-- Servers are only configured if they're available via Mason or system install

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
    },
    config = function()
        -- Get default capabilities from nvim-cmp
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- Helper function to configure and enable LSP server if available
        local function setup_if_available(server_name, opts)
            opts = opts or {}
            opts.capabilities = capabilities

            -- Configure the server
            vim.lsp.config(server_name, opts)

            -- Try to enable the server; if it's not installed, this will silently fail
            local ok = pcall(vim.lsp.enable, server_name)
            if not ok then
                vim.notify(
                    string.format("LSP server '%s' not available on this machine", server_name),
                    vim.log.levels.DEBUG
                )
            end
        end

        -- Protocol Buffers
        setup_if_available("protols", {
            init_options = {
                include_paths = {
                    vim.fn.expand("~/shared-protos"),
                    ".",
                }
            }
        })

        -- Lua
        setup_if_available("lua_ls", {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            }
        })

        -- Day job servers
        setup_if_available("csharp_ls", {})
        setup_if_available("terraformls", {})
        setup_if_available("tflint", {})
        setup_if_available("dockerls", {})
        setup_if_available("docker_compose_language_service", {})
        setup_if_available("bashls", {})
        setup_if_available("jsonls", {})

        -- Fun projects
        setup_if_available("svelte", {})
        setup_if_available("ts_ls", {})
        setup_if_available("cssls", {})
        setup_if_available("rust_analyzer", {
            settings = {
                ["rust-analyzer"] = {
                    checkOnSave = {
                        command = "clippy"
                    }
                }
            }
        })
        setup_if_available("sqlls", {})
        setup_if_available("eslint", {})
        setup_if_available("powershell_es", {})
        setup_if_available("html", {})
    end,
}
