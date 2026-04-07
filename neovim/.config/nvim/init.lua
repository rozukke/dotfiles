if vim.loader then
  -- Magic speed hack
  vim.loader.enable()
end

-- Disable unneeded default plugins
local disabled_plugins = {
  'gzip',
  'netrwPlugin',
  'rplugin',
  'tarPlugin',
  'tutor',
  'zipPlugin',
  'tohtml',
}
for _, plugin in ipairs(disabled_plugins) do
  vim.g["loaded_" .. plugin] = 1
end

require('opts')
require('keys')
require('autocmds')
require('lsp')
