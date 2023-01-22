local present, null_ls = pcall(require, "null-ls")

if not present then
   return
end

local b = null_ls.builtins

local sources = {
    -- Python
    b.diagnostics.pylint.with({
        diagnostics_postprocess = function(diagnostic)
            diagnostic.code = diagnostic.message_id
        end,
        method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
        timeout = 10000,
        only_local = "tools/venv/bin",
    }),
    b.diagnostics.pydocstyle.with({
        method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
    }),
    b.formatting.isort,
    b.formatting.black,
    b.diagnostics.jsonlint,

   -- Lua
   -- b.formatting.stylua,

   -- Shell
   -- b.formatting.shfmt,
   -- b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
}

null_ls.setup {
    debug = true,
    sources = sources,
    on_attach = require("plugins.configs.lspconfig").on_attach
}
