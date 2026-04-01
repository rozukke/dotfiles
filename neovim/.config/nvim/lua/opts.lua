-- General =========================================================================================
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.mouse = 'a'
vim.o.switchbuf = 'usetab'

vim.o.undofile = true

-- Annoying
vim.o.swapfile = false

vim.o.shada = "'100,<50,s10,:1000,/100,@100,h"

-- UI ==============================================================================================
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = '100'
vim.opt.cursorline = true

vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.tabstop = 4

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  See `:help 'clipboard'`
vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.breakindent = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.o.winborder = 'rounded'
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live
vim.opt.inccommand = 'split'

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
