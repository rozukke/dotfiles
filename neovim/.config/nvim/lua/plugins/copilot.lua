---@type LazyPluginSpec
return {
    -- NOTE: requires node v22, and NOT newer or older.
    'zbirenbaum/copilot.lua',
    enabled = true,
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
        require('copilot').setup({
            panel = {
                enabled = false,
            },
            suggestion = {
                keymap = {
                    accept = '<C-Y>',
                    dismiss = '<Esc>',
                    next = '<C-c>',
                },
                trigger_on_accept = false,
            },
        })
    end,
}
