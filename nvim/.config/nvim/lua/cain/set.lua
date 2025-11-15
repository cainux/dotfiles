-- Set <space> to be the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.guicursor = ""

-- Line numbers, and make them relative
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode (don't judge me)
vim.opt.mouse = "a"

-- Don't show the mode
vim.opt.showmode = false

-- Sync the clipboard between the OS and Neovim
vim.opt.clipboard = "unnamedplus"

-- Ensure wrapped lines are also indented
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- How splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Let me know when things are getting too wide
vim.opt.colorcolumn = "120"

-- Tabbing and indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Incremental? search
vim.opt.incsearch = true

-- No wrapping!
vim.opt.wrap = false

-- Not sure what this one does
vim.opt.termguicolors = true

-- I prefer this off
vim.opt.fixeol = false

-- Set cursor to bar in insert mode, block in other modes
vim.opt.guicursor = {
  "n-v-c-sm:block", -- normal, visual, command, select mode: block cursor
  "i-ci-ve:ver25",  -- insert, command-line insert, visual-exclude: vertical bar (25% width)
  "r-cr-o:hor20",   -- replace, command-line replace, operator-pending: horizontal bar (20% height)
}

vim.api.nvim_create_autocmd("VimLeave", {
  command = "set guicursor=a:ver20"
})
