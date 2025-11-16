return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "Issafalcon/neotest-dotnet",
        "nvim-neotest/neotest-jest",
    },
    config = function()
        local neotest = require "neotest"
        neotest.setup {
            adapters = {
                require "neotest-dotnet" {
                    -- dotnet_additional_args = { "--verbosity detailed" },
                },
                require "neotest-jest" {
                    jestCommand = "npm test --",
                    jestConfigFile = function(file)
                        if string.find(file, "/packages/") then
                            -- print(file)
                            local foo = string.match(file, "(.-/[^/]+/)test") .. "jest.config.js"
                            print(foo)
                            return foo
                        end

                        return vim.fn.getcwd() .. "/jest.config.ts"
                    end,
                    -- env = { CI = true },
                    cwd = function(path) return vim.fn.getcwd() end,
                },
            },
        }

        local map = function(keys, func, desc) vim.keymap.set("n", "<leader>" .. keys, func, { desc = "Test: " .. desc }) end

        map("tt", function() neotest.run.run(vim.fn.expand "%") end, "Run File")
        map("tT", function() neotest.run.run(vim.uv.cwd()) end, "Run All Test Files")
        map("tr", function() neotest.run.run() end, "Run Nearest")
        map("tl", function() neotest.run.run_last() end, "Run Last")
        map("ts", function() neotest.summary.toggle() end, "Toggle Summary")
        map("to", function() neotest.output.open { enter = true, auto_close = true } end, "Show Output")
        map("tO", function() neotest.output_panel.toggle() end, "Toggle Output Panel")
        map("tS", function() neotest.run.stop() end, "Stop")
    end,
}
