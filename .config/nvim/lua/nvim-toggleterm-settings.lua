require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  open_mapping = [[<c-space>]],
  hide_numbers = false, -- hide the number column in toggleterm buffers
  shade_filetypes = {"none"},
  shade_terminals = false,
  shading_factor = '1', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = false,
  direction = 'horizontal',
  close_on_exit = true, -- close the terminal window when the process exits
  -- shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_win_open'
    -- see :h nvim_win_open for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'curved', -- | 'double' | 'shadow' | 'curved' | -- other options supported by win open
    -- width = <value>,
    -- height = <value>,
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}

-- TODO find a way to make this work
-- vim.api.nvim_set_keymap('n', '<C-_>', ':ToggleTerm direction=horizontal<CR>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<C-Space>', ':ToggleTerm direction=float<CR>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('t', '<C-_>', [[<c-\><c-n>]]':ToggleTerm<CR>', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('t', '<C-Space>', [[<c-\><c-n>]]':ToggleTerm<CR', {noremap = true, silent = true})
-- nnoremap <silent> <C-_> :ToggleTerm direction=horizontal<CR>
-- nnoremap <silent> <C-Space> :ToggleTerm direction=float<CR>
-- tnoremap <silent> <C-_> <c-\><c-n>:ToggleTerm<CR>
-- tnoremap <silent> <C-Space> <c-\><c-n>:ToggleTerm<CR>
