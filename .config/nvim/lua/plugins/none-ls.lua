return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.golangci_lint,
				null_ls.builtins.formatting.gofmt,
				-- null_ls.builtins.diagnostics.pylint.with({
				-- 	diagnostics_postprocess = function(diagnostic)
				-- 		diagnostic.code = diagnostic.message_id
				-- 	end,
				-- }),
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.black,
			}
		})
		vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})
	end
}
