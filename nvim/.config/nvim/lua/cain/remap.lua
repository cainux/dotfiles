-- Couple of interesting ways of leaving insert mode
vim.keymap.set("i", "<C-c>", "<ESC>")
vim.keymap.set("i", "jk", "<ESC>")

-- This is decades old for me
vim.keymap.set("n", "<C-s>", ":update<CR>")

-- This might make sense for me...
vim.keymap.set("n", "<leader>fs", ":update<CR>", { desc = "[F]ile [S]ave" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- I'm starting to like Netrw
vim.keymap.set("n", "<leader>on", vim.cmd.Ex, { desc = "[O]pen [N]etrw" })

-- Trying these out for a bit
vim.keymap.set("n", "<leader>gwp", "<cmd>!git add . && git commit -am 'wip' && git push<CR>", { desc = "[g]it commit -am [w]ip && git [p]ush" })
