return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pylsp", "gopls", "bashls" }
			})
		end
	},
	{
		'neovim/nvim-lspconfig',
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities
			})
			lspconfig.pylsp.setup({
				capabilities = capabilities
			})
			lspconfig.gopls.setup({
				capabilities = capabilities
			})
			lspconfig.bashls.setup({
				capabilities = capabilities
			})
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
			vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
		end
	}

}
