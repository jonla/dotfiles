-- Dap config

local present, dap = pcall(require, "dap")

if not present then
    return
end

dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = '~/.local/share/vs_code/extension/debugAdapters/bin/OpenDebugAD7',
}

dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
        MIMode = "gdb",
        sourceFileMap = {
            ["/proc/self/cwd"] = '${workspaceFolder}'
        },
        setupCommands = {  
            { 
                text = '-enable-pretty-printing',
                description =  'enable pretty printing',
                ignoreFailures = false 
            },
        },
    },
}
