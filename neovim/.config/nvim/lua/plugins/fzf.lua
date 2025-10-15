return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = "FzfLua",
		keys = {
			{ "<leader>s" },
		},
		opts = {},
		config = function()
			require("fzf-lua").setup()
			vim.keymap.set("n", "<leader>sh", require("fzf-lua").helptags, { desc = "[S]earch [H]elp" })
			vim.keymap.set("n", "<leader>sf", require("fzf-lua").files, { desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "<leader>sb", require("fzf-lua").buffers, { de<Down>c = "[S]earch [B]uffers" })
			vim.keymap.set("n", "sg", require("fzf-lua").live_grep, { desc = "[S]earch [G]rep" })
			vim.keymap.set("n", "<leader>sg", require("fzf-lua").git_files, { desc = "[S]earch [R]oot" })
			vim.keymap.set("n", "<leader>sa", require("fzf-lua").resume, { desc = "[S]earch [A]gain (recent)" })
			vim.keymap.set("n", "<leader>q", require("fzf-lua").diagnostics_workspace, { desc = "[Q]uickfix" })
		end,
	},
}
