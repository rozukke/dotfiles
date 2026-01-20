---@type LazyPluginSpec
return {
    'swaits/zellij-nav.nvim',
    event = 'VeryLazy',
    keys = {
        { '<A-m>', '<cmd>ZellijNavigateLeftTab<cr>', { silent = true, desc = 'navigate left or tab' } },
        { '<A-n>', '<cmd>ZellijNavigateDown<cr>', { silent = true, desc = 'navigate down' } },
        { '<A-e>', '<cmd>ZellijNavigateUp<cr>', { silent = true, desc = 'navigate up' } },
        { '<A-i>', '<cmd>ZellijNavigateRightTab<cr>', { silent = true, desc = 'navigate right or tab' } },
    },
    config = function()
        require('zellij-nav').setup()
        -- Unlock zellij when window unfocused
        vim.api.nvim_create_autocmd('VimLeave', {
            pattern = '*',
            command = [[silent !zellij action switch-mode normal]],
        })
    end,
}
