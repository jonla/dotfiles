-- chadrc


-- if treesitter braks
-- https://github.com/nvim-treesitter/nvim-treesitter/issues/3092
-- if formatting is not working
-- https://github.com/NvChad/NvChad/issues/1541

-- TODO
-- cmp <C-x><C-n> like word + line completion + file
--      https://github.com/hrsh7th/cmp-path/issues/61
-- SRC:
--      keymap to bazel run, build, build debug
--      customize command to run debug
--      handle python (pyright) in src
-- MW:
--      dockerized DAP
--      dockerized LSP?
--      use correct black and isort settings -> pyproject.toml?
--      use correct pydocstyle settings
--
-- telescope find relative files does not load proper theme
-- setup custom commands to execute somehow?
-- hide tabufline on startup
-- make "previous command" mean previous command in this terminal when running commands
-- Make LSP floating documentation less brutal
-- Fix bug when terminal becomes full screen
-- Zenmode hide line numbers when switching buffer

M = {}
M.ui = {
  theme = "gruvbox",
  transparency = vim.g.neovide == nil,
}
M.plugins = require "custom.plugins"
M.mappings = require "custom.mappings"
return M
