-- Astro depends on typescript. Stolen from nvim-lspconfig
local function get_typescript_server_path(root_dir)
	local project_root = vim.fs.dirname(vim.fs.find("node_modules", { path = root_dir, upward = true })[1])
	return project_root and vim.fs.joinpath(project_root, "node_modules", "typescript", "lib") or ""
end

---@type vim.lsp.Config
return {
	cmd = {
		"astro-ls",
		"--stdio",
	},
	filetypes = {
		"astro",
		"ts",
	},
	root_markers = {
		"package.json",
		"tsconfig.json",
		"jsconfig.json",
		".git",
	},
	init_options = {
		typescript = {},
	},
	before_init = function(_, config)
		if not config.init_options.typescript.tsdk then
			config.init_options.typescript.tsdk = get_typescript_server_path(config.root_dir)
		end
	end,
}
