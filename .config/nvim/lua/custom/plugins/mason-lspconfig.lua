local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  return
end

local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
  return
end

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
  return
end

opts = {
    on_attach = require("plugins.configs.lspconfig").on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = {"vim"}
            }
        },
        python = {
            pythonPath = "tools/venv/bin/python",
            analysis = {
                diagnosticMode = "openFilesOnly"
            }
        }
    }
}

local _lsp = {}
function _lsp.setup()
  mason.setup({})
  mason_lspconfig.setup({})

  mason_lspconfig.setup_handlers {
    function(server_name)
      require("lspconfig")[server_name].setup(opts)
    end
  }
end

return _lsp
