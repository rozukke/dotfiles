-- [[ Basic Autocommands ]]

-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	desc = "Proper 'formatoptions'",
	group = vim.api.nvim_create_augroup("format-options", { clear = true }),
	callback = function()
		vim.cmd("setlocal formatoptions-=c formatoptions-=o")
	end,
})
