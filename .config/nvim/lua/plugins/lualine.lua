return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		require('lualine').setup({
			options = {
				theme = 'dracula',
				-- padding = { left = 0, right = 0 },
			}
		})
	end
}
