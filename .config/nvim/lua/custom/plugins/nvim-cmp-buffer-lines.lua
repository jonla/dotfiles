-- nvim-cmp-buffer-lines config

local present, nvim-cmp-buffer-lines = pcall(require, "nvim-cmp-buffer-lines")

if not present then
   return
end

nvim-cmp-buffer-lines.setup({
    -- debug = true,
    -- sources = sources,
    -- on_attach = require("plugins.configs.lspconfig").on_attach
})
