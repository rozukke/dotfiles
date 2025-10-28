-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Open last position when re-opening file
vim.api.nvim_create_autocmd("BufWinEnter", {
	desc = "Jump to last cursor position when reopening file",
	pattern = "*",
	command = [[ if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]],
})

-- Remove extraneous whitespace on save (exclude markdown, which has significant end-line whitespace)
vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Remove extraneous whitespace on save",
	pattern = "*",
	callback = function()
		local filename = vim.fn.expand("%:t")
		if not filename:match("%.md$") then
			vim.cmd("%s/\\s\\+$//e")
		end
	end,
})

-- Auto resize split windows
vim.api.nvim_create_autocmd("VimResized", {
	desc = "Auto resize split windows",
	pattern = "*",
	command = "tabdo wincmd =",
})

-- Set default indentation settings (gets overwritten by Sleuth)
vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile" }, {
	pattern = "*",
	callback = function()
		if vim.bo.buftype ~= "" then
			return
		end
		vim.opt_local.tabstop = 4
		if vim.fn.line("$") == 1 and vim.fn.getline(1) == "" then
			vim.opt_local.shiftwidth = 4
			vim.opt_local.expandtab = true
		end
	end,
})

-- Gets overwritten by Sleuth
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
