vim.api.nvim_create_autocmd('VimEnter', {
    once = true,
    callback = function()
        vim.cmd.packadd('projectworks-local.nvim')

        require('projectworks').setup({
            base_url = "https://shieldai.projectworksapp.com",
            user_id = "69",
            picker = "auto",
            mappings = true
        })
    end,
})
