---@type LazyPluginSpec
return { -- Collection of various small independent plugins/modules
    'nvim-mini/mini.nvim',
    config = function()
        require('mini.extra').setup()

        -- Better Around/Inside textobjects
        --
        -- Examples:
        --  - va)  - [V]isually select [A]round [)]paren
        --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
        --  - ci'  - [C]hange [I]nside [']quote
        require('mini.ai').setup({ n_lines = 500 })

        -- Simple and easy statusline.
        --  You could remove this setup call if you don't like it,
        --  and try some other statusline plugin
        local statusline = require('mini.statusline')
        -- set use_icons to true if you have a Nerd Font
        statusline.setup({ use_icons = true })
        -- You can configure sections in the statusline by overriding their
        -- default behavior. For example, here we set the section for
        -- cursor location to LINE:COLUMN
        ---@diagnostic disable-next-line: duplicate-set-field
        statusline.section_location = function()
            return '%2l:%-2v'
        end

        require('mini.files').setup({
            mappings = {
                go_in = '<Right>',
                go_out = '<Left>',
            },
        })
        -- Open in current buffer directory
        vim.keymap.set('n', '<leader>o', function()
            if vim.bo.buftype == '' then
                MiniFiles.open(vim.api.nvim_buf_get_name(0))
                MiniFiles.reveal_cwd()
            else
                MiniFiles.open()
            end
        end, { desc = '[O]pen file navigator' })
        vim.api.nvim_create_autocmd('User', {
            pattern = 'MiniFilesBufferCreate',
            callback = function(args)
                vim.keymap.set('n', '<CR>', function()
                    local e = MiniFiles.get_fs_entry()
                    local is_dir = e ~= nil and e.fs_type == 'directory'
                    MiniFiles.go_in()
                    if not is_dir then
                        MiniFiles.close()
                    end
                end, { buffer = args.data.buf_id })
            end,
        })

        -- Override default notification provider
        require('mini.notify').setup({
            lsp_progress = {
                enable = false,
            },
        })
        vim.notify = require('mini.notify').make_notify({
            ERROR = { duration = 5000 },
            WARN = { duration = 5000 },
        })

        -- Highlight certain words and hex colors
        local hipatterns = require('mini.hipatterns')
        local hi_words = MiniExtra.gen_highlighter.words
        hipatterns.setup({
            highlighters = {
                -- Highlight a fixed set of common words. Will be highlighted in any place,
                -- not like "only in comments".
                fixme = hi_words({ 'FIXME', 'Fixme', 'fixme' }, 'MiniHipatternsFixme'),
                hack = hi_words({ 'HACK', 'Hack', 'hack' }, 'MiniHipatternsHack'),
                todo = hi_words({ 'TODO', 'Todo', 'todo' }, 'MiniHipatternsTodo'),
                note = hi_words({ 'NOTE' }, 'MiniHipatternsNote'),

                -- Highlight hex color string (#aabbcc) with that color as a background
                hex_color = hipatterns.gen_highlighter.hex_color(),
            },
        })

        -- Session management
        require('mini.sessions').setup()
        vim.keymap.set('n', '<leader>ww', function()
            -- Basename of working dir
            MiniSessions.write(vim.fn.getcwd():match('[^/]+$') .. '.vim')
        end, { desc = '[W]rite session' })

        require('mini.starter').setup({
            header = [[
                                          █████      █████
                                         ▒▒███      ▒▒███
 ████████   ██████   █████████ █████ ████ ▒███ █████ ▒███ █████  ██████
▒▒███▒▒███ ███▒▒███ ▒█▒▒▒▒███ ▒▒███ ▒███  ▒███▒▒███  ▒███▒▒███  ███▒▒███
 ▒███ ▒▒▒ ▒███ ▒███ ▒   ███▒   ▒███ ▒███  ▒██████▒   ▒██████▒  ▒███████
 ▒███     ▒███ ▒███   ███▒   █ ▒███ ▒███  ▒███▒▒███  ▒███▒▒███ ▒███▒▒▒
 █████    ▒▒██████   █████████ ▒▒████████ ████ █████ ████ █████▒▒██████
▒▒▒▒▒      ▒▒▒▒▒▒   ▒▒▒▒▒▒▒▒▒   ▒▒▒▒▒▒▒▒ ▒▒▒▒ ▒▒▒▒▒ ▒▒▒▒ ▒▒▒▒▒  ▒▒▒▒▒▒
]],
        })

        local miniclue = require('mini.clue')
        miniclue.setup({
            -- Define which clues to show. By default shows only clues for custom mappings
            -- (uses `desc` field from the mapping; takes precedence over custom clue).
            clues = {
                { mode = 'n', keys = '<Leader>s', desc = '[S]earch' },
                { mode = 'n', keys = '<Leader>g', desc = '[G]it' },
                { mode = 'n', keys = '<Leader>t', desc = '[T]oggle...' },
                miniclue.gen_clues.builtin_completion(),
                miniclue.gen_clues.g(),
                miniclue.gen_clues.marks(),
                miniclue.gen_clues.registers(),
                -- This creates a submode for window resize mappings. Try the following:
                -- - Press `<C-w>s` to make a window split.
                -- - Press `<C-w>+` to increase height. Clue window still shows clues as if
                --   `<C-w>` is pressed again. Keep pressing just `+` to increase height.
                --   Try pressing `-` to decrease height.
                -- - Stop submode either by `<Esc>` or by any key that is not in submode.
                miniclue.gen_clues.windows({ submode_resize = true }),
                miniclue.gen_clues.z(),
            },
            -- Explicitly opt-in for set of common keys to trigger clue window
            triggers = {
                { mode = 'n', keys = '<Leader>' }, -- Leader triggers
                { mode = 'x', keys = '<Leader>' },
                { mode = 'n', keys = '\\' }, -- mini.basics
                { mode = 'n', keys = '[' }, -- mini.bracketed
                { mode = 'n', keys = ']' },
                { mode = 'x', keys = '[' },
                { mode = 'x', keys = ']' },
                { mode = 'i', keys = '<C-x>' }, -- Built-in completion
                { mode = 'n', keys = 'g' }, -- `g` key
                { mode = 'x', keys = 'g' },
                { mode = 'n', keys = "'" }, -- Marks
                { mode = 'n', keys = '`' },
                { mode = 'x', keys = "'" },
                { mode = 'x', keys = '`' },
                { mode = 'n', keys = '"' }, -- Registers
                { mode = 'x', keys = '"' },
                { mode = 'i', keys = '<C-r>' },
                { mode = 'c', keys = '<C-r>' },
                { mode = 'n', keys = '<C-w>' }, -- Window commands
                { mode = 'n', keys = 'z' }, -- `z` key
                { mode = 'x', keys = 'z' },
            },
        })
    end,
}
