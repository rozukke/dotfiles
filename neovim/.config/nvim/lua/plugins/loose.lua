return {
	{
		"tpope/vim-sleuth",
		{
			"szymonwilczek/vim-be-better",
			cmd = "VimBeBetter",
		},
		-- Highlight todo, notes, etc in comments
		{
			"folke/todo-comments.nvim",
			event = "VimEnter",
			dependencies = { "nvim-lua/plenary.nvim" },
			opts = { signs = false },
		},
	},
}
