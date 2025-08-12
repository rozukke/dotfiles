-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Keybinds to make split navigation easier.
vim.keymap.set("n", "<C-left>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-right>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-down>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-up>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Comment shortcut
vim.keymap.set("n", "<C-/>", "gcc", { desc = "Toggle comment", remap = true })
vim.keymap.set("v", "<C-/>", "gc", { desc = "Toggle comment", remap = true })

-- Line enders
vim.keymap.set("n", "<leader>;", "mzA;<Esc>`z", { desc = "Add semicolon to end of line" })
vim.keymap.set("n", "<leader>,", "mzA,<Esc>`z", { desc = "Add comma to end of line" })

-- Sleuth
vim.keymap.set("n", "<leader>i", ":Sleuth<CR>", { desc = "[I]ndent" })

vim.keymap.set("n", "<leader>e", function()
	return vim.diagnostic.open_float({ scope = "cursor" })
end)
