-- LSP server configurations
-- Servers are only configured if they're available via Mason or system install
--
-- Machine-specific overrides:
-- Create ~/.config/nvim/lua/machine_lsp.lua with custom configurations
-- Example machine_lsp.lua:
--   return {
--       csharp_ls = { filetypes = { "cs" } },
--       lua_ls = { settings = { Lua = { workspace = { library = vim.api.nvim_get_runtime_file("", true) } } } }
--   }

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
    },
    config = function()
        local lspconfig = require("lspconfig")

        -- Get default capabilities from nvim-cmp
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- Try to load machine-specific LSP configurations
        local machine_config = {}
        local ok, machine_module = pcall(require, "machine_lsp")
        if ok then
            machine_config = machine_module
            vim.notify("Loaded machine-specific LSP configurations", vim.log.levels.INFO)
        end

        -- Helper function to check if LSP server is available
        local function setup_if_available(server_name, opts)
            opts = opts or {}
            opts.capabilities = capabilities

            -- Merge with machine-specific config if available
            if machine_config[server_name] then
                opts = vim.tbl_deep_extend("force", opts, machine_config[server_name])
            end

            -- Try to setup the server; if it's not installed, this will silently fail
            local ok = pcall(lspconfig[server_name].setup, opts)
            if not ok then
                vim.notify(
                    string.format("LSP server '%s' not available on this machine", server_name),
                    vim.log.levels.DEBUG
                )
            end
        end

        -- Protocol Buffers
        setup_if_available("protols", {})

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
