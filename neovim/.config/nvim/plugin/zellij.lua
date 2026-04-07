vim.api.nvim_create_autocmd('VimEnter', {
  once = true,
  callback = function()
    if not vim.fn.executable('zellij') then
      return
    end

    vim.pack.add({
      'https://github.com/swaits/zellij-nav.nvim',
    })

    require('zellij-nav').setup()

    -- Unlock zellij when window unfocused
    vim.api.nvim_create_autocmd('VimLeave', {
      pattern = '*',
      command = [[silent !zellij action switch-mode normal]],
    })

    -- Navigation
    vim.keymap.set({ 'n', 'i', 'v' }, '<A-m>', '<cmd>ZellijNavigateLeftTab<cr>',
      { silent = true, desc = 'navigate left or tab' })
    vim.keymap.set({ 'n', 'i', 'v' }, '<A-n>', '<cmd>ZellijNavigateDownTab<cr>',
      { silent = true, desc = 'navigate down or tab' })
    vim.keymap.set({ 'n', 'i', 'v' }, '<A-e>', '<cmd>ZellijNavigateUpTab<cr>',
      { silent = true, desc = 'navigate up or tab' })
    vim.keymap.set({ 'n', 'i', 'v' }, '<A-i>', '<cmd>ZellijNavigateRightTab<cr>',
      { silent = true, desc = 'navigate right or tab' })
  end,
})
