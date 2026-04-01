vim.api.nvim_create_autocmd("LspAttach", {
  pattern = "*.lua",
  callback = function()
    vim.pack.add({ "https://github.com/folke/lazydev.nvim" })
    require("lazydev").setup({
      library = {
        '~/.local/share/nvim/lazy/',

        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    })
  end,
})
