return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	config = function ()
		local wk = require("which-key")
		wk.add({
			{ "<leader>f", group = "file" }, -- group
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find Text"},
			{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files"},
			{ "<leader>fn", desc = "New File" },
			{ "<leader>f1", hidden = true }, -- hide this keymap
			{ "<leader>w", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
			{ "<leader>b", group = "buffers", expand = function()
				return require("which-key.extras").expand.buf()
			end
			},
			-- window management
			{"<leader>s", group = "Split window"},
			{"<leader>sv", "<C-w>v", desc = "Split window vertically" },
			{"<leader>sh", "<C-w>s", desc = "Split window horizontally" },
			{"<leader>se", "<C-w>=", desc = "Make splits equal size" },
			{"<leader>sx", "<cmd>close<CR>", desc = "Close current split" },

			{"<leader>t", group = "Tabs"},
			{"<leader>to", "<cmd>tabnew<CR>", desc = "Open new tab" },
			{"<leader>tx", "<cmd>tabclose<CR>", desc = "Close current tab" },
			{"<leader>tn", "<cmd>tabn<CR>", desc = "Go to next tab" },
			{"<leader>tp", "<cmd>tabp<CR>", desc = "Go to previous tab" },
			{"<leader>tf", "<cmd>tabnew %<CR>", desc = "Open current buffer in new tab" },


				{
					-- Nested mappings are allowed and can be added in any order
					-- Most attributes can be inherited or overridden on any level
					-- There's no limit to the depth of nesting
					mode = { "n", "v" }, -- NORMAL and VISUAL mode
					{ "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
					{ "<leader>w", "<cmd>w<cr>", desc = "Write" },
				}
		})

	end
}
