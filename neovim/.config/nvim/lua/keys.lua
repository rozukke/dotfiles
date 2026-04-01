-- Remove highlight from search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Only want this when navigation via zellij not available
if not vim.fn.executable('zellij') then
    vim.keymap.set('n', '<A-m>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
    vim.keymap.set('n', '<A-i>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
    vim.keymap.set('n', '<A-n>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
    vim.keymap.set('n', '<A-e>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
end

-- Easier scrolling for my keyboard layout
vim.keymap.set('n', '<PageUp>', '<C-u>', { desc = 'Scroll up half page ' })
vim.keymap.set('n', '<PageDown>', '<C-d>', { desc = 'Scroll down half page ' })

-- Float error/diagnostic - should work both line-wide and for a specific error
-- A bit heavy but this is not easily attainable behaviour
vim.keymap.set('n', '<leader>e', function()
    local lnum, col = unpack(vim.api.nvim_win_get_cursor(0))
    -- Annoying nvim API oddity
    lnum, col = lnum - 1, col - 1

    local diagnostics = vim.diagnostic.get(0, { lnum = lnum })

    -- Filtering to cursor yoinked from nvim core (diagnostic.lua)
    local line_length = #vim.api.nvim_buf_get_lines(0, lnum, lnum + 1, true)[1]
    diagnostics = vim.tbl_filter(function(d)
        return lnum >= d.lnum
            and lnum <= d.end_lnum
            and (lnum ~= d.lnum or col >= math.min(d.col, line_length - 1))
            and ((d.lnum == d.end_lnum and d.col == d.end_col) or lnum ~= d.end_lnum or col < d.end_col)
    end, diagnostics)

    -- No cursor diagnostics, check line
    if #diagnostics == 0 then
        return vim.diagnostic.open_float({ scope = 'line' })
    end
    -- Cursor scoped diagnostics only
    return vim.diagnostic.open_float({ scope = 'cursor' })
end, { desc = 'Float error' })

-- Interactive visual line indent
vim.keymap.set('v', '<', '<gv', { desc = 'Visually indent line' })
vim.keymap.set('v', '>', '>gv', { desc = 'Visually indent line' })
