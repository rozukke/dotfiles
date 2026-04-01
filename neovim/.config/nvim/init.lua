if vim.loader then
    -- Magic speed hack
    vim.loader.enable()
end

require('core.opts')
require('core.keys')
require('core.autocmds')
require('core.lsp')

-- -- Is this something I need to bother disabling?
-- disabled_plugins = {
--     'gzip',
--     'netrwPlugin',
--     'rplugin',
--     'tarPlugin',
--     'tutor',
--     'zipPlugin',
--     'tohtml',
