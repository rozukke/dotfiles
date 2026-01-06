return {
    {
        'ibhagwan/fzf-lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        cmd = 'FzfLua',
        keys = {
            { '<leader>s' },
        },
        opts = {
            files = {
                fd_opts = [[--color=never --hidder --type f --type l --exclude .git --exclude build ]],
            },
        },
        config = function()
            require('fzf-lua').setup()
            vim.keymap.set('n', '<leader>sh', require('fzf-lua').helptags, { desc = '[S]earch [H]elp' })
            vim.keymap.set('n', '<leader>sf', require('fzf-lua').files, { desc = '[S]earch [F]iles' })
            vim.keymap.set('n', '<leader>sb', require('fzf-lua').buffers, { desc = '[S]earch [B]uffers' })
            vim.keymap.set('n', '<leader>ss', require('fzf-lua').live_grep, { desc = '[S]earch [G]rep' })
            vim.keymap.set('n', '<leader>sg', require('fzf-lua').git_files, { desc = '[S]earch [G]it' })
            vim.keymap.set('n', '<leader>sa', require('fzf-lua').resume, { desc = '[S]earch [A]gain (recent)' })
            vim.keymap.set('n', '<leader>q', require('fzf-lua').diagnostics_workspace, { desc = '[Q]uickfix' })
            vim.keymap.set('n', '<leader>sm', function()
                local sessions = require('mini.sessions').detected
                require('fzf-lua').fzf_exec(vim.tbl_keys(sessions), {
                    prompt = '> ',
                    previewer = 'builtin',
                    preview = {
                        fn = function(s)
                            return vim.inspect(sessions[s[1]])
                        end,
                    },

                    actions = {
                        ['default'] = function(selected)
                            local session_name = selected[1]
                            if session_name then
                                require('mini.sessions').read(session_name)
                            end
                        end,
                    },

                    winopts = {
                        width = 80,
                        height = 30,
                        row = 20,
                        col = 80,
                        title = 'Sessions',
                        title_pos = 'center',
                    },
                })
            end, { desc = 'Open project session' })
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
                callback = function(event)
                    -- Utility function to easily define mappings specific to LSP related items.
                    -- It sets the mode, buffer and description for us each time.
                    local map = function(keys, func, desc, mode)
                        mode = mode or 'n'
                        vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                    end

                    map('gd', require('fzf-lua').lsp_definitions, '[G]oto [D]efinition')
                    map('grt', require('fzf-lua').lsp_typedefs, '[G]oto [T]ype')
                    map('grr', require('fzf-lua').lsp_references, '[G]oto [R]eferences')
                    map('gri', require('fzf-lua').lsp_implementations, '[G]oto [I]mplementation')
                    map('gO', require('fzf-lua').lsp_document_symbols, '[D]ocument [S]ymbols')
                end,
            })
        end,
    },
}
