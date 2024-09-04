return {
	"nvim-treesitter/nvim-treesitter", 
	build = ":TSUpdate",
	config = function()
		vim.keymap.set('n', '<leader>n', ':Neotree filesystem reveal left<CR>')
		local config = require("nvim-treesitter.configs")
		config.setup({
			auto_install = true,
			ensure_installed ={"lua", "python", "bash", "go"},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end
}

