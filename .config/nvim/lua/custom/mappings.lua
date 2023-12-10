-- lua/custom/mappings

local utils = require("custom.utils")

local function termcodes(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

vim.g.diagnostics_visible = false
local function toggle_diagnostics()
    if vim.g.diagnostics_visible then
        vim.g.diagnostics_visible = false
        vim.api.nvim_echo({ { "Disable diagnostics" } }, false, {})
        vim.diagnostic.disable()
    else
        vim.g.diagnostics_visible = true
        vim.api.nvim_echo({ { "Enable diagnostics" } }, false, {})
        vim.diagnostic.enable()
    end
end

local M = {}

-- add this table only when you want to disable default keys
M.disabled = {
    n = {
        ["<leader>n"] = "",
        ["<leader>rn"] = "",
        ["<leader>tt"] = "",
        ["<leader>tk"] = "",
        ["<leader>th"] = "",
        ["<leader>td"] = "",
        ["<leader>gb"] = "",
        ["<leader>ph"] = "",
        ["<leader>rh"] = "",
        ["<C-s>"] = "",
        ["<C-c>"] = "",
        ["<leader>uu"] = "",
        ["<leader>b"] = "",
        ["<Bslash>"] = "",
        ["<leader>x"] = "",
        ["<leader>q"] = "",
        ["<C-n>"] = "",
        ["<leader>e"] = "",
        ["<leader>cm"] = "",
        ["<leader>gt"] = "",
        ["<leader>pt"] = "",
        ["<leader>h"] = "",
        ["<leader>v"] = "",
        ["<leader>wK"] = "",
        ["<leader>wk"] = "",
        ["<leader>wa"] = "",
        ["<leader>wr"] = "",
        ["<leader>wl"] = "",
        ["<leader>ls"] = "",
        ["j"] = "",
        ["k"] = "",
        ["<Up>"] = "",
        ["<Down>"] = "",
        ["<leader>D"] = "",
        ["<leader>ra"] = "",
        ["<A-i>"] = "",
        ["<A-h>"] = "",
        ["<A-v>"] = "",
        ["d]"] = "",
        ["<leader>f"] = "",
        ["<leader>ca"] = "",
        ["<leader>fm"] = "",
    },
}

local RelativeSearch = function()

    local cwd = vim.fn.expand('%:h')
    vim.fn.getcwd()
    if cwd == '' then
        cwd = vim.fn.getcwd()
    end
    local opts = {
        cwd = cwd,
        prompt_title = "Relative files",
        hidden = true,
        follow = true
    }
    require('telescope.builtin').find_files(opts)
end

M.harpoon = {
    n = {
        ["<leader>jj"] = {
            function()
                require("harpoon.ui").toggle_quick_menu()
            end,
            "toggle harpoon menu",
        }
    }
}

local harpoon_mappings = {
    a = 1, s = 2, d = 3, f = 4, g = 5,
    z = 6, x = 7, c = 8, v = 9, b = 10,
}

for k, v in pairs(harpoon_mappings) do
    M.harpoon.n["<leader>j" .. k] = {
        function()
            require("harpoon.ui").nav_file(v)
            vim.api.nvim_echo({ { "Harpooning to #" .. v } }, false, {})
        end,
        "navigate to harpoon mark " .. v,
    }
    M.harpoon.n["<leader>J" .. k] = {
        function()
            require("harpoon.mark").set_current_at(v)
            vim.api.nvim_echo({ { "Impaled file with harpoon #" .. v } }, false, {})
        end,
        "set harpoon mark at " .. v,
    }
end

M.refactoring = {
    v = {
        ["<leader>av"] = {
            function()
                require("refactoring").refactor("Extract Variable")
            end,
        },
        ["<leader>am"] = {
            function()
                require("refactoring").refactor("Extract Function")
            end,
        },
        ["<leader>ai"] = {
            function()
                require("refactoring").refactor("Inline variable")
            end,
        },
    },
    n = {
        ["<leader>av"] = {
            function ()
                require("refactoring").refactor("Inline variable")
            end
        }
    }
}

-- nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
M.dap = {
    n = {
        -- nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
        ["<leader>dd"] = {
            function()
                require('dap').run_last()
            end,
            "re-run previous debug configuration"
        },
        ["<leader>db"] = {
            function()
                require("dap").toggle_breakpoint()
            end,
            "toggle breakpoint"
        },
        ["<leader>dc"] = {
            function()
                require("dap").toggle_breakpoint(vim.fn.input('Breakpoint condition: '))
            end,
            "toggle breakpoint with condition"
        },
        ["<leader>dr"] = {
            function()
                require("dap").continue()
            end,
            "dap continue/run"
        },
        ["<leader>ds"] = {
            function()
                require("dap").step_over()
            end,
            "dap step over"
        },
        ["<leader>di"] = {
            function()
                require("dap").step_into()
            end,
            "dap step into"
        },
        ["<leader>do"] = {
            function()
                require("dap").step_out()
            end,
            "dap step out"
        },
        ["<leader>dx"] = {
            function()
                require("dap").terminate()
            end,
            "dap terminate"
        }
    }
}

M.dapui = {
    n = {
        ["<leader>du"] = {
            function()
                require("dapui").toggle()
            end,
            "dapui toggle"
        },
        ["<leader>df"] = {
            function()
                require("dapui").eval()
            end,
            "dapui eval/hover variable"
        },
        ["<leader>dv"] = {
            function()
                require("dapui").float_element("scopes")
            end,
            "dapui float variables element"
        },
        ["<leader>dp"] = {
            function()
                require("dapui").float_element("breakpoints")
            end,
            "dapui float breakpoints element"
        },
        ["<leader>dw"] = {
            function()
                require("dapui").float_element("watches")
            end,
            "dapui float watches element"
        },
        ["<leader>dl"] = {
            function()
                require("dapui").float_element("console")
            end,
            "dapui float console element"
        },
    },
    v = {
        ["<leader>df"] = {
            function()
                require("dapui").eval()
            end,
            "dapui eval/hover variable"
        },
    }
}

local ft_commands = {
    python = function()
        local cwd = vim.fn.getcwd()
        local run_path = cwd .. '/run'
        if utils.file_exists(run_path) then
            return run_path
        else
            return utils.get_python_path(cwd)
        end
    end,
    lua = function()
        return "lua"
    end,
}
M.nvterm = {
    n = {
        ["<leader>rf"] = {
            function()
                local file_path = vim.fn.expand("%")
                local filetype = vim.bo.filetype
                local cmd = ft_commands[filetype]
                if cmd ~= nil then
                    require("nvterm.terminal").send(cmd() .. ' ' .. file_path)
                else
                    print("\"" .. filetype .. "\" files not supported!")
                end
            end,
            "run current file in terminal"
        },
        ["<leader>rr"] = {
            function()
                require("nvterm.terminal").send("!!")
            end,
            "re-run previous command"
        },
        ["<A-i>"] = {
            function()
                require("nvterm.terminal").toggle "float"
            end,
            "toggle floating term",
        },

        ["<C-space>"] = {
            function()
                require("nvterm.terminal").toggle "horizontal"
            end,
            "toggle horizontal term",
        },

        ["<A-v>"] = {
            function()
                require("nvterm.terminal").toggle "vertical"
            end,
            "toggle vertical term",
        },
    },
    t = {
        -- toggle in terminal mode
        ["<A-i>"] = {
            function()
                require("nvterm.terminal").toggle "float"
            end,
            "toggle floating term",
        },

        ["<C-space>"] = {
            function()
                require("nvterm.terminal").toggle "horizontal"
            end,
            "toggle horizontal term",
        },

        ["<A-v>"] = {
            function()
                require("nvterm.terminal").toggle "vertical"
            end,
            "toggle vertical term",
        },
    }
}

M.gitsigns = {
    n = {
        ["<leader>hu"] = {
            function()
                require("gitsigns").reset_hunk()
            end,
            "Undo hunk",
        },

        ["<leader>hp"] = {
            function()
                require("gitsigns").preview_hunk()
            end,
            "Preview hunk",
        },
        ["<leader>hs"] = {
            function()
                require("gitsigns").stage_hunk()
            end,
            "Stage hunk",
        },
    }
}

M.telescope = {
    n = {
        ["<leader>fd"] = { "<cmd> Telescope find_files cwd=~/dotfiles/ prompt_title=Dotfiles hidden=true follow=true <CR>",
            "find dotfiles" },
        ["<leader>s?"] = { "<cmd> Telescope spell_suggest <CR>", "suggest spelling" },
        ["<leader>fs"] = {
            function()
                require("telescope.builtin").grep_string({grep_open_files=true})
            end,
            "Find word under cursor in open buffers",
        },
        ["<leader>fe"] = {
            function()
                RelativeSearch()
            end,
            "Fild files relative buffer"
        },
    },
}

M.dir_telescope = {
    n = {
        ["<leader>fg"] = { ":GrepInDirectory <CR>", "telescope live grep in directory" },
    }
}

M.nvimtree = {
    n = {
        -- toggle
        ["<leader>t"] = {
            function()
                vim.cmd "NvimTreeFindFileToggle"
                vim.cmd "wincmd p"
            end,
            "toggle nvimtree"
        },

        -- focus
        ["<leader>T"] = { "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },
    },
}

M.tabufline = {
    n = {
        -- close buffer + hide terminal buffer
        -- ["<leader>q"] = {
        --   function()
        --     require("nvchad_ui.tabufline").close_buffer()
        --   end,
        --   "close buffer",
        -- },
        -- ["<leader>Q"] = {
        --   function()
        --     require("nvchad_ui.tabufline").close_buffer()
        --   end,
        --   "close buffer",
        -- },
    },
}

M.lspconfig = {
    n = {
        -- Go to
        ["<leader>gt"] = {
            function()
                vim.lsp.buf.type_definition()
            end,
            "lsp definition type",
        },
        ["gh"] = { "<cmd> ClangdSwitchSourceHeader <CR>", "swtich between source and header file" },
        -- Actions
        ["<leader>ar"] = {
            function()
                require("nvchad_ui.renamer").open()
            end,
            "lsp rename",
        },
        ["<leader>af"] = {
            function()
                vim.lsp.buf.format { async = true }
            end,
            "lsp formatting",
        },
        ["<leader>ac"] = {
            function()
                vim.lsp.buf.code_action()
            end,
            "lsp code_action",
        },
        -- Diagnostics
        ["<leader>dt"] = {
            function()
                toggle_diagnostics()
            end,
            "toggle diagnostic",
        },
        ["<leader>dh"] = {
            function()
                vim.diagnostic.open_float()
            end,
            "hover floating diagnostic",
        },
        ["<leader>dq"] = {
            function()
                vim.diagnostic.setloclist()
            end,
            "diagnostic setloclist",
        },
        ["]d"] = {
            function()
                vim.diagnostic.goto_next()
            end,
            "goto_next",
        },
    }
}

M.custom = {
    n = {
        ["<space>"] = { "<Nop>", "" },
        [";"] = { ":", "" },
        [":"] = { ";", "" },
        ["<leader>+"] = { ":exe \"resize \" . (winheight(0) * 6/5)<CR>", "Increase win size" },
        ["<leader>-"] = { ":exe \"resize \" . (winheight(0) * 5/6)<CR>", "Decrease win size" },
        ["<leader>w"] = { ":w!<cr>", "Save" },
        -- ["<leader>Q"] = {":q<cr>", "Exit"},
        ["Q"] = { "<nop>", "Disable ex mode" },
        ["<C-h>"] = { "<c-w>h", "" },
        ["<C-j>"] = { "<c-w>j", "" },
        ["<C-k>"] = { "<c-w>k", "" },
        ["<C-l>"] = { "<c-w>l", "" },
        ["<leader>o"] = { ":only<cr>", "" },
        ["<leader>q"] = { ":bd<cr>", "" },
        ["<tab>"] = { ":bnext<cr>", "" },
        ["<s-tab>"] = { ":bprevious<cr>", "" },
        ["<leader>l"] = { ":e#<cr>", "" },
        ["<leader>cs"] = { ":let @+=expand(\"%:t\")<CR>", "" },
        ["<leader>cr"] = { ":let @+=fnamemodify(expand(\"%\"), \":~:.\")<CR>", "", opts = { silent = true } },
        ["<leader>cl"] = { ":let @+=expand(\"%:p\")<CR>", "" },
        ["0"] = { "^", "" },
        ["<leader>ss"] = { ":setlocal spell!<cr>", "" },
        ["<leader>e"] = { ":e <C-r>=expand(\"%:h\")<CR>/", "propmt for edit in buffer directory" },
        ["<leader>b"] = {
            function()
                if vim.opt.showtabline._value == 2 then
                    vim.opt.showtabline = 0
                else
                    vim.opt.showtabline = 2
                end
            end,
            "toggle bufferline"
        },
        ["<C-p>"] = { "<C-i>", "Since C-i == Tab, use something else for jumplist backwards" },
    },
    i = {
        -- more keys!
    },
    v = {
        [";"] = { ":", "Semicolon as colon" },
        [":"] = { ";", "Colon as semicolon" },
        ["<"] = { "<gv", "Reduce indent" },
        [">"] = { ">gv", "Increase indent" },
        ["<up>"] = { ":m '<-2<CR>gv=gv", "Move visual selection up" },
        ["<down>"] = { ":m '>+1<CR>gv=gv", "Move visual selection down" },
        -- vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
        -- vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
        ["<C-h>"] = { "<Esc><c-w>h", "" },
        ["<C-j>"] = { "<Esc><c-w>j", "" },
        ["<C-k>"] = { "<Esc><c-w>k", "" },
        ["<C-l>"] = { "<Esc><c-w>l", "" },

    },
    c = {
        ["<C-k>"] = { "<Up>", "Move up the command line" },
        ["<C-j>"] = { "<Down>", "Moved down the command line" },
    },
    t = {
        ["<C-h>"] = { termcodes "<c-\\><c-n><c-w>h", "move to window left" },
        ["<C-j>"] = { termcodes "<c-\\><c-n><c-w>j", "move to window down" },
        ["<C-k>"] = { termcodes "<c-\\><c-n><c-w>k", "move to window up" },
        ["<C-l>"] = { termcodes "<c-\\><c-n><c-w>l", "move to window right" },
    }
}

return M
