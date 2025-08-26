return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		config = function()
			require("snacks").setup({
				bigfile = { enabled = true },
				quickfile = { enabled = true },
				dashboard = { enabled = true },
				notifier = { enabled = true },
				lazygit = { enabled = true },
			})
			vim.keymap.set("n", "<leader>lg", Snacks.lazygit.open, { desc = "[L]azy [G]it" })
		end,
	},
}
