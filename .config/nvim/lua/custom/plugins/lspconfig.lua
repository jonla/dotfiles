-- custom lsp

local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  return
end

local utils = require("custom.utils")

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local servers = { "pyright", "clangd"}
-- memo: check available clangd settings in lspconfig repo

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = function(client, bufnr)
            on_attach(client, bufnr)
            client.config.settings.python.pythonPath = utils.get_python_path(client.config.root_dir)
        end,
        capabilities = capabilities,
        settings = {
            Lua = {
                diagnostics = {
                    globals = {"vim"}
                }
            },
            python = {
                pythonPath = "tools/venv/bin/python",
                analysis = {
                    diagnosticMode = "openFilesOnly",
                    typeCheckingMode = "off"
                }
            }
        },
    }
end
