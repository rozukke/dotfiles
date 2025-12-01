return {
    { -- Autocompletion
        'saghen/blink.cmp',
        event = 'InsertEnter',
        version = '1.*',
        dependencies = {
            'folke/lazydev.nvim',
            'rafamadriz/friendly-snippets',
        },
        --- @module "blink.cmp"
        --- @type blink.cmp.Config
        opts = {
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
        },
    },
}
