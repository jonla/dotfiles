--Neovide settings
local opt = vim.opt
-- opt.guifont="DejaVuSansMono Nerd Font Mono:h6:i"
opt.guifont="DejaVu Sans Mono:h17:#e-subpixelantialias"
-- opt.guifont="DejaVuSansMono:h10:i"
-- opt.guifont="FreeMono:h10:i"

vim.g.neovide_fullscreen="v:true"
vim.g.neovide_cursor_animation_length=0.03
vim.g.neovide_cursor_trail_length=0.0
vim.g.neovide_cursor_antialiasing="v:true"

vim.g.neovide_scale_factor=0.5
local function ChangeScaleFactor(factor)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * factor
end

vim.keymap.set("n", "<C-=>", function() ChangeScaleFactor(1.25) end)
vim.keymap.set("n", "<C-->", function() ChangeScaleFactor(1/1.25) end)

vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0

vim.g.neovide_transparency = 0.8

vim.g.neovide_fullscreen = "v:false"
