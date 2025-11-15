return {
    "nvim-treesitter/nvim-treesitter",
    -- branch = "main",
    tag = "v0.10.0",
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local configs = require "nvim-treesitter"

        configs.setup {
            ensure_installed = {
                "lua",
                "vim",
                "vimdoc",
                "query",
                "hcl",
                "c_sharp",
                "javascript",
                "typescript",
                "yaml",
                "dockerfile",
                "svelte",
                "java",
                "json",
                "jsonc",
            },
            auto_install = false,
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
            autotag = { enable = true },
        }
    end,
}
