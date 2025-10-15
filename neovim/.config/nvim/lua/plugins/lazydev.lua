-- Lua LSP helper for vim dev
return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				"~/.local/share/nvim/lazy/",

				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	}
}
