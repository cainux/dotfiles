return {
    "folke/flash.nvim",
    event = "VeryLazy",
    config = function()
        require("flash").setup()
        vim.keymap.set("n", "<leader>h", function() require("flash").jump() end, { desc = "⚡️Flas[h]" })
    end,
}
