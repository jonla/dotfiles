-- Harpoon config

local present, harpoon = pcall(require, "harpoon")

if not present then
   return
end

harpoon.setup({
    -- debug = true,
    -- sources = sources,
    -- on_attach = require("plugins.configs.lspconfig").on_attach
})
