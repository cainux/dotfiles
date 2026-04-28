return {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
        local conform = require "conform"

        conform.setup {
            formatters_by_ft = {
                lua = { "stylua" },
                hcl = { "tofu_fmt" },
                terraform = { "tofu_fmt" },
                tf = { "tofu_fmt" },
                ["terraform-vars"] = { "tofu_fmt" },
            },
            formatters = {
                tofu_fmt = {
                    command = "tofu",
                    args = { "fmt", "-" },
                },
            }
        }

        vim.keymap.set("n", "<leader>cf", function()
            conform.format { lsp_fallback = true }
        end, { desc = "[C]ode [F]ormat" })
    end,
}
