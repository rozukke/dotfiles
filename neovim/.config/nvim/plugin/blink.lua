vim.api.nvim_create_autocmd('InsertEnter', {
  once = true,
  callback = function()
    vim.pack.add({
      { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('1.x') },
      -- Deps
      'https://github.com/rafamadriz/friendly-snippets',
      'https://github.com/folke/lazydev.nvim'
    })

    require('blink.cmp').setup({
      keymap = {
        preset = 'default',
      },

      appearance = {
        -- Icon spacing
        nerd_font_variant = 'mono',
      },

      completion = {
        -- `<c-space>` to show documentation or `auto_show` to true
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'lazydev', 'buffer' },
        providers = {
          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
            score_offset = 100,
          },
        },
      },

      fuzzy = { implementation = 'prefer_rust_with_warning' },
      signature = { enabled = true },
    })
  end,
})
