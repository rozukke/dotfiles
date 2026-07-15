vim.api.nvim_create_autocmd('BufWritePre', {
  once = true,
  callback = function()
    vim.pack.add({ 'https://github.com/stevearc/conform.nvim' })
    require("conform").setup({
      notify_on_error = true,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        local lsp_format_opt
        if disable_filetypes[vim.bo[bufnr].filetype] then
          lsp_format_opt = 'never'
        else
          lsp_format_opt = 'fallback'
        end
        return {
          timeout_ms = 500,
          lsp_format = lsp_format_opt,
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        html = { 'prettierd' },
        python = { 'ruff_format' },
        nix = { 'nixfmt' },
        cpp = { 'clang_format' },
        c = { 'clang_format' },
      },
      formatters = {
        clang_format = {
          prepend_args = { '--style=file', '--fallback-style=LLVM' }
        }
      }
    })
  end
})
