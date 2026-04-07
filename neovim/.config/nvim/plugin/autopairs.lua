vim.api.nvim_create_autocmd('InsertEnter', {
  once = true,
  callback = function()
    vim.pack.add({
      'https://github.com/windwp/nvim-autopairs',
    })
    require('fidget').setup({
      ignored_next_char = '[%S]'
    })
  end,
})
