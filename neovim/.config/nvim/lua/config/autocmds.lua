-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- Open last position when re-opening file
vim.api.nvim_create_autocmd('BufWinEnter', {
    desc = 'Jump to last cursor position when reopening file',
    pattern = '*',
    command = [[ if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]],
})

-- Remove extraneous whitespace on save (exclude markdown, which has significant end-line whitespace)
vim.api.nvim_create_autocmd('BufWritePre', {
    desc = 'Remove extraneous whitespace on save',
    pattern = '*',
    callback = function()
        local filename = vim.fn.expand('%:t')
        if not filename:match('%.md$') then
            vim.cmd('%s/\\s\\+$//e')
        end
    end,
})

-- Auto resize split windows
vim.api.nvim_create_autocmd('VimResized', {
    desc = 'Auto resize split windows',
    pattern = '*',
    command = 'tabdo wincmd =',
})

-- My little sleuth replacement
local function detect_buf_expandtab()
    local last_line = math.min(vim.api.nvim_buf_line_count(0), 100)

    local indented_lines = 0
    local tab_count = 0

    for _, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, last_line, false)) do
        local leading = line:match('^(%s+)')
        if leading then
            indented_lines = indented_lines + 1
            if leading:find('\t') then
                tab_count = tab_count + 1
            end
        end
    end

    return indented_lines == 0 or tab_count <= (indented_lines / 2)
end

-- Simple tabs/spaces detection
vim.api.nvim_create_autocmd('BufReadPost', {
    group = vim.api.nvim_create_augroup('AutoIndentDetect', { clear = true }),
    callback = function()
        vim.bo.expandtab = detect_buf_expandtab()
    end,
})
