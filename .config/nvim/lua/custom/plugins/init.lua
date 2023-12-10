-- custom/plugins/init.lua
local utils = require("custom.utils")

return {
    ["tpope/vim-fugitive"] = {
        setup = function()
            vim.cmd('source' .. vim.fn.stdpath('config') .. '/custom/fugitive.vim')
        end
    },
    ["nvim-treesitter/nvim-treesitter"] = {
        override_options = {
            indent = {
                enable = false,
            },
            yati = {
                enable = true,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '<leader>n',
                    node_incremental = '<leader>n',
                    -- scope_incremental = '<c-s>',
                    node_decremental = '<leader>m',
                },
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ['aa'] = '@parameter.outer',
                        ['ia'] = '@parameter.inner',
                        ['af'] = '@function.outer',
                        ['if'] = '@function.inner',
                        ['ac'] = '@class.outer',
                        ['ic'] = '@class.inner',
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        [']a'] = '@parameter.outer',
                        [']m'] = '@function.outer',
                        [']]'] = '@class.outer',
                    },
                    goto_next_end = {
                        [']A'] = '@parameter.outer',
                        [']M'] = '@function.outer',
                        [']['] = '@class.outer',
                    },
                    goto_previous_start = {
                        ['[a'] = '@parameter.outer',
                        ['[m'] = '@function.outer',
                        ['[['] = '@class.outer',
                    },
                    goto_previous_end = {
                        ['[A'] = '@parameter.outer',
                        ['[M'] = '@function.outer',
                        ['[]'] = '@class.outer',
                    },
                },
                -- swap = {
                --     enable = true,
                --     swap_next = {
                --         ['<leader>a'] = '@parameter.inner',
                --     },
                --     swap_previous = {
                --         ['<leader>A'] = '@parameter.inner',
                --     },
                -- },
            },
        },
    },
    ["nvim-treesitter/nvim-treesitter-textobjects"] = {
        after = 'nvim-treesitter',
    },
    ['Wansmer/treesj'] = {
        requires = { 'nvim-treesitter' },
        config = function()
            require('treesj').setup()
        end,
    },
    ["tpope/vim-surround"] = {},
    ["tpope/vim-sleuth"] = {},
    ["tpope/vim-unimpaired"] = {},
    ["tpope/vim-repeat"] = {},
    ["chrisgrieser/nvim-various-textobjs"] = {
        config = function()
            require("various-textobjs").setup({ useDefaultKeymaps = true })
        end,
    },
    ["lakshayg/vim-bazel"] = {},
    ["ThePrimeagen/refactoring.nvim"] = {
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-treesitter/nvim-treesitter" },
        },
    },
    ["mfussenegger/nvim-dap"] = {
        config = function()
            require("custom.plugins.dap")
        end,
    },
    ["rcarriga/nvim-dap-ui"] = {
        after = { "nvim-dap-python" },
        config = function()
            require("custom.plugins.dapui")
        end
    },
    ["justinmk/vim-sneak"] = {
        setup = function()
            vim.cmd('source' .. vim.fn.stdpath('config') .. '/custom/sneak.vim')
        end
    },
    ["ThePrimeagen/harpoon"] = {
        config = function()
            require("custom.plugins.harpoon")
        end
    },
    ["amarakon/nvim-cmp-buffer-lines"] = { after = "cmp-buffer" },
    ["andersevenrud/cmp-tmux"] = { after = "nvim-cmp-buffer-lines" },
    ["NvChad/ui"] = {
        override_options = {
            statusline = {
                separator_style = "default", -- default/round/block/arrow
                overriden_modules = function()
                    return require "custom.plugins.statusline_override"
                end
            },
            tabufline = {
                enabled = false,
                lazyload = false,
                overriden_modules = nil,
            },
        }
    },
    ["kyazdani42/nvim-tree.lua"] = {
        ft = "alpha",
        -- cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFileToggle" },
        config = function()
            require "plugins.configs.nvimtree"
        end,
        setup = function()
            require("core.utils").load_mappings "nvimtree"
        end,
    },
    ["jose-elias-alvarez/null-ls.nvim"] = {
        after = "nvim-lspconfig",
        setup = function()
            require("core.lazy_load").on_file_open "null-ls.nvim"
        end,
        config = function()
            require "custom.plugins.null-ls"
        end,
    },
    -- ["williamboman/mason-lspconfig.nvim"] = {
    --     after = "mason.nvim",
    --     setup = function()
    --         require("core.lazy_load").on_file_open "mason-lspconfig.nvim"
    --     end,
    --     config = function()
    --         require("custom.plugins.mason-lspconfig").setup()
    --     end,
    -- },
    ["neovim/nvim-lspconfig"] = {
        -- after = "mason-lspconfig.nvim",
        opt = true,
        setup = function()
            require("core.lazy_load").on_file_open "nvim-lspconfig"
        end,
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.plugins.lspconfig"
        end,
    },
    ["hrsh7th/nvim-cmp"] = {
        override_options = function()
            local cmp = require("cmp")
            return {
                completion = {
                    completeopt = "menu,menuone",
                    -- autocomplete = false,
                },
                window = {
                    documentation = {
                        border = utils.border "CmpBorder",
                    },
                },
                formatting = {
                    format = function(_, vim_item)
                        local icons = require("nvchad_ui.icons").lspkind
                        vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
                        vim_item.abbr = string.sub(vim_item.abbr, 1, 30)
                        vim_item.menu = ""
                        return vim_item
                    end,
                },
                -- preselect = cmp.PreselectMode.None,
                sources = {
                    { name = "luasnip" },
                    { name = "nvim_lsp" },
                    {
                        name = "buffer",
                        option = {
                            get_bufnrs = function()
                                return vim.api.nvim_list_bufs()
                            end
                        }
                    },
                    { name = "nvim_lua" },
                    { name = "path" },
                    -- Disabled becaues of https://github.com/amarakon/nvim-cmp-buffer-lines/issues/9
                    -- {
                    --     name = "buffer-lines",
                    --     option = {
                    --     leading_whitespace = false,
                    --     }
                    -- },
                    {
                        name = "tmux",
                        option = {
                            all_panes = true
                        }
                    },
                },
                mapping = {
                    ["<Tab>"] = require("cmp").mapping(function(fallback)
                        local col = vim.fn.col('.') - 1
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif require("luasnip").jumpable() then
                            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true,
                                true), "")
                        elseif not (col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')) then
                            cmp.complete()
                            cmp.select_next_item()
                        else
                            fallback()
                        end
                    end, {
                        "i",
                        "s",
                    }),
                }
            }
        end
    },
    ['nvim-telescope/telescope-fzf-native.nvim'] = {
        run = 'make',
        cond = vim.fn.executable 'make' == 1,
    },
    ["nvim-telescope/telescope.nvim"] = {
        -- after = "telescope-fzf-native",
        override_options = function()
            local actions = require("telescope.actions")
            return {
                defaults = {
                    file_ignore_patterns = { ".git/" },
                    mappings = {
                        i = {
                            ["<Tab>"] = require("telescope.actions.layout").toggle_preview,
                            ["<C-c>"] = actions.close,
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<esc>"] = actions.close,
                        },
                        n = {
                            ["<Tab>"] = require("telescope.actions.layout").toggle_preview,
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist
                        }
                    },
                },
                extensions_list = { "themes", "terms", "fzf" },
                extensions = {
                    fzf = {
                        fuzzy = true, -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true, -- override the file sorter
                        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                    }
                }
            }
        end
    },
    ["princejoogie/dir-telescope.nvim"] = {
        requires = "nvim-telescope/telescope.nvim",
        after = "telescope.nvim",
        config = function()
            require("dir-telescope").setup({
                hidden = false,
                show_preview = false,
            })
        end
    },
    ["yioneko/nvim-yati"] = {
        tag = "*",
        requires = "nvim-treesitter/nvim-treesitter",
    },
    ["folke/zen-mode.nvim"] = {
        config = function()
            require("zen-mode").setup {
                window = {
                    options = {
                        signcolumn = "no", -- disable signcolumn
                        number = false, -- disable number column
                        -- relativenumber = false, -- disable relative numbers
                        -- cursorline = false, -- disable cursorline
                        -- cursorcolumn = false, -- disable cursor column
                        -- foldcolumn = "0", -- disable fold column
                        -- list = false, -- disable whitespace characters
                    },
                },
                plugins = {
                    gitsigns = { enabled = false },
                    tmux = { enabled = false },
                    twilight = { enabled = true },
                }
            }
        end
    },
    ["folke/twilight.nvim"] = {
        config = function()
            require("twilight").setup()
        end
    },
}
