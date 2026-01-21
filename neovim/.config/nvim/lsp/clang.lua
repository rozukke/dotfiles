-- https://clangd.llvm.org/extensions.html#switch-between-sourceheader
local function switch_source_header(bufnr, client)
    local method_name = 'textDocument/switchSourceHeader'
    ---@diagnostic disable-next-line:param-type-mismatch
    if not client or not client:supports_method(method_name) then
        return vim.notify(
            ('method %s is not supported by any servers active on the current buffer'):format(method_name)
        )
    end
    local params = vim.lsp.util.make_text_document_params(bufnr)
    ---@diagnostic disable-next-line:param-type-mismatch
    client:request(method_name, params, function(err, result)
        if err then
            error(tostring(err))
        end
        if not result then
            vim.notify('corresponding file cannot be determined')
            return
        end
        vim.cmd.edit(vim.uri_to_fname(result))
    end, bufnr)
end

---@type vim.lsp.Config
return {
    cmd = {
        'clangd',
        '--clang-tidy',
        '--background-index',
    },
    filetypes = {
        'c',
        'cpp',
        'h',
        'hpp',
        'cc',
    },
    root_markers = {
        'compile_commands.json',
        '.git',
        '.clangd',
    },
    init_options = {
        fallbackFlags = { '-std=c++17' },
    },
    on_attach = function(client, _)
        -- Toggle header/impl
        vim.keymap.set('n', 'gh', function()
            switch_source_header(vim.api.nvim_get_current_buf(), client)
        end, { desc = '[G]o to [H]eader file' })
        -- Open header/impl in split
        vim.keymap.set('n', '<leader>wh', function()
            local win = vim.api.nvim_get_current_win()
            vim.cmd('vsplit')
            local buf_new = vim.api.nvim_get_current_buf()
            switch_source_header(buf_new, client)
            vim.api.nvim_set_current_win(win)
        end, { desc = 'Open [W]indow for [H]eader' })
    end,
}
