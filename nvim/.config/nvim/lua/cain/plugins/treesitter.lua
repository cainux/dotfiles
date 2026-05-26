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
        require("nvim-treesitter").install {
            "lua",
            "vim",
            "vimdoc",
            "query",
            "hcl",
            "terraform",
            "c_sharp",
            "javascript",
            "typescript",
            "yaml",
            "dockerfile",
            "svelte",
            "java",
            "json",
            "proto",
        }

        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                pcall(vim.treesitter.start, args.buf)
            end,
        })

        require("nvim-ts-autotag").setup()
    end,
}
