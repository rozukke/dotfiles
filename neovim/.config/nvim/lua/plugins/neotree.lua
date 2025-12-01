---@type LazyPluginSpec
return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'main',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'MunifTanjim/nui.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    lazy = false,
    config = function()
        vim.keymap.set('n', '<leader>tt', function()
            vim.cmd('Neotree')
        end)
    end,
}
