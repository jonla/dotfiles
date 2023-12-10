-- custom init

-- Options
local opt = vim.opt

opt.writebackup = false
opt.swapfile = false
opt.splitkeep = "screen"
opt.scrolloff = 7
opt.path:append "**"
opt.wildignore:append "*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store"
opt.cursorline  = true
opt.whichwrap   = ""
-- opt.lazyredraw  = true
opt.showmatch   = true
opt.matchtime   = 2
opt.timeout = false
opt.ttimeoutlen = 0
opt.shortmess:append "c"
opt.shiftround = true
-- opt.shiftwidth = 4
-- opt.tabstop = 4
-- opt.softtabstop = 4
opt.linebreak = true
opt.textwidth = 500
opt.wrap = false
opt.diffopt:append "vertical"
opt.switchbuf = "useopen"
opt.jumpoptions = "stack"
opt.pumheight = 4
opt.undofile = false
-- opt.showtabline = 0
opt.numberwidth = 4

-- Autocommands
local core_group = vim.api.nvim_create_augroup('Core', { clear = true })
-- When switching buffers, preserve window view.
-- https://vim.fandom.com/wiki/Avoid_scrolling_when_switch_buffers
-- Save current view settings on a per-window, per-buffer basis.
local saved_buf_view = {}
vim.api.nvim_create_autocmd("bufleave", {
    callback = function(args)
        saved_buf_view[args.buf] = vim.fn.winsaveview()
    end,
    group = core_group
})

-- Restore current view settings.
vim.api.nvim_create_autocmd("bufenter", {
    callback = function(args)
        if saved_buf_view[args.buf] ~= nil then
            local view = vim.fn.winsaveview()
            if view['lnum'] == 1 and view['col'] == 0 then
                vim.fn.winrestview(saved_buf_view[args.buf])
            end
            -- table.remove(saved_buf_view, args.buf)
        end
    end,
    group = core_group
})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd('bufreadpost', {
    callback = function()
        local mark = vim.fn.line("'\"")
        if mark > 1 and mark <= vim.fn.line("$") then
            vim.cmd("normal! g'\"")
        end
    end,
    group = core_group
})

vim.api.nvim_create_autocmd('vimenter', {
    callback = function()
        vim.diagnostic.disable()
    end,
    group = core_group
})

-- highlight on yank
-- see `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('textyankpost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = core_group,
    pattern = '*',
})

vim.api.nvim_create_autocmd('vimenter', {
    callback = function()
        vim.cmd("clearjumps")
    end,
    group = core_group,
})
--Neovide settings
require 'custom.neovide'
