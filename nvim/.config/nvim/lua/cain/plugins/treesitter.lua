return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    -- tag = "v0.10.0",
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").setup {
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
                "proto",
            },
            auto_install = true,
        }

        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                pcall(vim.treesitter.start)
            end,
        })

        require("nvim-ts-autotag").setup()
    end,
}
