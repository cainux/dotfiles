return { -- Useful plugin to show you pending keybinds.
    "folke/which-key.nvim",
    event = "VimEnter", -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
        local wk = require "which-key"
        wk.setup()

        -- Document existing key chains
        wk.add {
            { "<leader>a", group = "[A]dd to Harpoon" },
            { "<leader>a_", hidden = true },
            { "<leader>c", group = "[C]ode" },
            { "<leader>c_", hidden = true },
            { "<leader>d", group = "[D]ocument" },
            { "<leader>d_", hidden = true },
            { "<leader>f", group = "[F]ile" },
            { "<leader>f_", hidden = true },
            { "<leader>o", group = "[O]pen" },
            { "<leader>o_", hidden = true },
            { "<leader>r", group = "[R]ename" },
            { "<leader>r_", hidden = true },
            { "<leader>s", group = "[S]earch" },
            { "<leader>s_", hidden = true },
            { "<leader>t", group = "[T]est" },
            { "<leader>t_", hidden = true },
            { "<leader>w", group = "[W]orkspace" },
            { "<leader>w_", hidden = true },
        }
    end,
}
