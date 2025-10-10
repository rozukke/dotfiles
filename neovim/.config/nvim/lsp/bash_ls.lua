local utils = require("core.utils");

---@type vim.lsp.Config
return {
	cmd = {
		"bash-language-server",
		"start",
	},
	settings = {
		bashIde = {
			-- Glob pattern for finding and parsing shell script files in the workspace.
			-- Used by the background analysis features across files.

			-- Prevent recursive scanning which will cause issues when opening a file
			-- directly in the home directory (e.g. ~/foo.sh).
			--
			-- Default upstream pattern is "**/*@(.sh|.inc|.bash|.command)".
			globPattern = vim.env.GLOB_PATTERN or "*@(.sh|.inc|.bash|.command)",
		},
	},
	on_attach = function()
		if not utils.exe_exists("shellcheck") then
			vim.notify("`shellcheck` not installed.", "warn")
		end
		if not utils.exe_exists("shfmt") then
			vim.notify("`shfmt` not installed.", "warn")
		end
	end,
	filetypes = { "zsh", "bash", "sh" },
	root_markers = { ".git", ".zshrc", ".bashrc" },
	single_file_support = true,
}
