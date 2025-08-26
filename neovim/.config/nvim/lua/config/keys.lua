-- [[ Basic Keymaps ]]
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Keybinds to make split navigation easier.
vim.keymap.set("n", "<C-left>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-right>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-down>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-up>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<leader>;", "mzA;<Esc>`z", { desc = "Add semicolon to end of line" })
vim.keymap.set("n", "<leader>,", "mzA,<Esc>`z", { desc = "Add comma to end of line" })

vim.keymap.set("n", "<leader>i", ":Sleuth<CR>", { desc = "[I]ndent" })

vim.keymap.set("n", "<leader>e", function()
	return vim.diagnostic.open_float({ scope = "cursor" })
end)
