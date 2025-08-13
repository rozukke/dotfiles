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
	on_attach = function(_, bufnr)
		-- https://clangd.llvm.org/extensions.html#switch-between-sourceheader
		local function switch_source_header()
			local method_name = 'textDocument/switchSourceHeader'
			local client = vim.lsp.get_clients({ bufnr = bufnr, name = 'clang' })[1]
			if not client then
				return vim.notify(('method %s is not supported by any servers active on the current buffer'):format(
					bufnr, method_name))
			end
			local params = vim.lsp.util.make_text_document_params(bufnr)
			client:request(method_name, params,
				function(err, result)
					if err then
						error(tostring(err))
					end
					if not result then
						vim.notify('corresponding file cannot be determined')
						return
					end
					vim.cmd.edit(vim.uri_to_fname(result))
				end,
				bufnr)
		end

		vim.keymap.set("n", "gh", function()
			switch_source_header()
		end, { desc = "LSP: [G]o to [H]eader" })
	end
}
