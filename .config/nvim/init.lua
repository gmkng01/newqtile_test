vim.g.mapleader = " "
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")

local keymap = vim.keymap -- for conciseness

vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<C-p>', '"+P', { noremap = true, silent = true })



-- Call the function when the dashboard is set up
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set up the dashboard as usual
alpha.setup(dashboard.opts)

-- vim.o.cmdheight = 0  -- Minimize command line height (Neovim 0.8+)
vim.o.laststatus = 3  -- Only show one global statusline instead of per buffer


