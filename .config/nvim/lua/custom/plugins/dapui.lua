-- Dap-ui config

local present, dap = pcall(require, "dap")

if not present then
   return
end

local present, dapui = pcall(require, "dapui")

if not present then
   return
end

dapui.setup({
    expand_lines = false,
    layouts = {
        {
            elements = {
                { id = "scopes", size = 0.25 },
                "breakpoints",
                "stacks",
                "watches",
            },
            size = 40,
            position = "left",
        },
        {
            elements = {
                "console",
                -- { id = "repl", size = 0.25 },
            },
            size = 0.25,
            position = "bottom",
        }
    },
    element_mappings = {
        breakpoints = {
            open = "<CR>",
            expand = "o"
        },
        stack = {
            open = "<CR>",
            expand = "o"
        }
    },
    controls = {
        element = "console"
    }
})


dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
