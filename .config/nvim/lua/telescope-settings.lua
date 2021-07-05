-- Telescope settings

local actions = require('telescope.actions')

require("telescope").setup {
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        },
        color_devicons = true,
        shorten_path = true,
        file_ignore_patterns = {".git"},
        mappings = {
            i = {
                ["<C-c>"] = actions.close,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                -- ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                ["<esc>"] = actions.close,

                -- To disable a keymap, put [map] = false
                -- ["<c-x>"] = false,

                -- Add up multiple actions
                ["<CR>"] = actions.select_default + actions.center

                -- You can perform as many actions in a row as you like
                -- ["<CR>"] = actions.select_default + actions.center + my_cool_custom_action,
            },
            n = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist
                -- ["<C-i>"] = my_cool_custom_action,
            }
        }
    },
    pickers = {
        -- Your special builtin config goes in here
        buffers = {
            file_ignore_patterns = {},
            sort_lastused = true,
            theme = "dropdown",
            previewer = false,
            shorten_path = true,
            mappings = {
                i = {
                    ["<c-d>"] = actions.delete_buffer,
                    --["<c-d>"] = "delete_buffer",
                },
                n = {
                    ["<c-d>"] = actions.delete_buffer,
                }
            }
        },
        find_files = {
            shorten_path = true,
        },
        oldfiles = {
            shorten_path = true,
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = false, -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            shorten_path = true
        }
    }
}

require('telescope').load_extension('fzf')

vim.api.nvim_set_keymap('n', '<leader>f', ':Telescope find_files hidden=true follow=true<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>b', ':Telescope buffers<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>H', ':Telescope oldfiles<CR>', {noremap = true, silent = true})
