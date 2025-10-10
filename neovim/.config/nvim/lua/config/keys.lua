-- [[ Basic Keymaps ]]
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Go back and forward
vim.keymap.set("n", "k", "<C-o>")
vim.keymap.set("n", "h", "<C-i>")

-- Keybinds to make split navigation easier.
vim.keymap.set("n", "<C-m>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-i>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-n>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-e>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<leader>;", "mzA;<Esc>`z", { desc = "Add semicolon to end of line" })
vim.keymap.set("n", "<leader>,", "mzA,<Esc>`z", { desc = "Add comma to end of line" })

vim.keymap.set("n", "<leader>i", ":Sleuth<CR>", { desc = "[I]ndent" })

vim.keymap.set("n", "<PageUp>", "<C-u>", { desc = "Scroll up half page " })
vim.keymap.set("n", "<PageDown>", "<C-d>", { desc = "Scroll down half page " })

vim.keymap.set("n", "<leader>e", function()
	return vim.diagnostic.open_float({ scope = "cursor" })
end)
