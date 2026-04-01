if vim.loader then
    -- Magic speed hack
    vim.loader.enable()
end

require('opts')
require('keys')
require('autocmds')
require('lsp')

-- -- TODO Is this something I need to bother disabling?
-- disabled_plugins = {
--     'gzip',
--     'netrwPlugin',
--     'rplugin',
--     'tarPlugin',
--     'tutor',
--     'zipPlugin',
--     'tohtml',
