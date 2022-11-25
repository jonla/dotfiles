" Neovide settings

set guifont=DejaVuSansMono\ Nerd\ Font\ Mono:h6

let g:neovide_fullscreen=v:true
let g:neovide_cursor_animation_length=0.03
let g:neovide_cursor_trail_length=0.0
let g:neovide_cursor_antialiasing=v:true

let g:neovide_scale_factor=1.0
function! ChangeScaleFactor(delta)
    let g:neovide_scale_factor = g:neovide_scale_factor * a:delta
endfunction
nnoremap <expr><C-=> ChangeScaleFactor(1.25)
nnoremap <expr><C--> ChangeScaleFactor(1/1.25)

let g:neovide_floating_blur_amount_x = 2.0
let g:neovide_floating_blur_amount_y = 2.0

let g:neovide_transparency = 1.0

let g:neovide_fullscreen = v:false
