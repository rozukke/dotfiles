return {
	{
		"tpope/vim-sleuth",
		-- Highlight todo, notes, etc in comments
		{
			"folke/todo-comments.nvim",
			event = "VimEnter",
			dependencies = { "nvim-lua/plenary.nvim" },
			opts = { signs = false },
		},
		{
			"chrisgrieser/nvim-spider",
			keys = {
				{ "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" } },
				{ "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" } },
				{ "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } },
			},
		},
	}
}
