vim.pack.add({
  'https://github.com/ibhagwan/fzf-lua',
  'https://github.com/nvim-tree/nvim-web-devicons'
})

local fzf = require('fzf-lua')
fzf.setup({
  files = {
    fd_opts = [[--color=never --hidden --type f --type l --exclude .git --exclude build ]],
  }
})

vim.keymap.set('n', '<leader>sh', fzf.helptags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sf', fzf.files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sb', fzf.buffers, { desc = '[S]earch [B]uffers' })
vim.keymap.set('n', '<leader>ss', fzf.live_grep, { desc = '[S]earch grep' })
vim.keymap.set('n', '<leader>sg', fzf.git_files, { desc = '[S]earch [G]it' })
vim.keymap.set('n', '<leader>sa', fzf.resume, { desc = '[S]earch [A]gain' })
vim.keymap.set('n', '<leader>q', fzf.diagnostics_workspace, { desc = '[Q]uickfix' })

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    map('gd', fzf.lsp_definitions, '[G]oto [D]efinition')
    map('grt', fzf.lsp_typedefs, '[G]oto [T]ype')
    map('grr', fzf.lsp_references, '[G]oto [R]eferences')
    map('gri', fzf.lsp_implementations, '[G]oto [I]mplementation')
    map('gO', fzf.lsp_document_symbols, '[D]ocument [S]ymbols')
  end,
})
