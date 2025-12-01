-- Remove highlight from search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<C-m>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-i>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-n>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-e>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Easier scrolling for my keyboard layout
vim.keymap.set('n', '<PageUp>', '<C-u>', { desc = 'Scroll up half page ' })
vim.keymap.set('n', '<PageDown>', '<C-d>', { desc = 'Scroll down half page ' })

-- Float error/diagnostic
vim.keymap.set('n', '<leader>e', function()
    return vim.diagnostic.open_float({ scope = 'cursor' })
end, { desc = 'Float error' })

-- Interactive visual line indent
vim.keymap.set('v', '<', '<gv', { desc = 'Visually indent line' })
vim.keymap.set('v', '>', '>gv', { desc = 'Visually indent line' })
