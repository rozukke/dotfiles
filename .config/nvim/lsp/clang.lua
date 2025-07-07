---@type vim.lsp.Config
return {
	cmd = {
		"clangd",
		"--clang-tidy",
		"--background-index",
	},
	filetypes = {
		"c",
		"cpp",
		"h",
		"hpp",
		"cc",
	},
	root_markers = {
		"compile_commands.json",
		"compile_flags.txt",
		".git",
		".clangd"
	},
	init_options = {
		fallbackFlags = { "-std=c++17" },
	},
}
