---@type LazyPluginSpec
return {
	"nvim-treesitter/nvim-treesitter",
	-- Using the rewrite branch which no longer provides `opts` and instead requires a config function
	-- This also requires tree-sitter CLI version 22+
	branch = "main",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		if vim.fn.executable("tree-sitter") == 0 then
			vim.notify(
				"Could not find 'tree-sitter' CLI. Please install to get syntax highlighting.",
				vim.log.levels.WARN
			)
			return
		end
		require("nvim-treesitter").setup()

		-- Manual version of "ensure_installed" and "auto_install" for 'main' branch rewrite
		require("nvim-treesitter").install({
			"bash",
			"python",
			"cpp",
			"c",
			"diff",
			"html",
			"css",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"query",
			"vim",
			"vimdoc",
		})

		-- Manual version of "highlight = {enabled = true}" and "indent = {enabled = true}"
		vim.api.nvim_create_autocmd("FileType", {
			desc = "Enable treesitter in supported buffers.",
			callback = function()
				pcall(vim.treesitter.start)
				vim.bo.indentexpr = "v:lua require('nvim-treesitter').indentexpr()"
			end,
		})
	end,
}
