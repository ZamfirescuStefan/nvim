return {
    'nvim-telescope/telescope.nvim',
    version = '0.1.5',
    dependencies = {
        {'nvim-lua/plenary.nvim'},
        {'nvim-telescope/telescope-live-grep-args.nvim'},
        {'nvim-telescope/telescope-file-browser.nvim'},
        {'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
    },
    config = function()

        local telescope = require('telescope')
        local builtin = require('telescope.builtin')
        local actions = require('telescope.actions')
        local lga_actions = require("telescope-live-grep-args.actions")
        local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")

        telescope.setup {
            defaults = {
                mappings = {
                    i = {
                        ['<C-k>'] = actions.cycle_history_next,
                        ['<C-j>'] = actions.cycle_history_prev,
                        ["<C-d>"] = actions.move_selection_next,
                        ["<C-u>"] = actions.move_selection_previous,
                    },
                    n = {
                        ['<C-k>'] = actions.cycle_history_next,
                        ['<C-j>'] = actions.cycle_history_prev,
                    }
                },
                file_browser = {
                    prompt_title = 'Find File',
                    search_dirs = true,
                    hidden = true,
                    hijack_netrw = true,
                },
                grep_string = {
                    prompt_title = 'Grep String',
                    search = '\\b%s\\b',
                }
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = 'smart_case',
                },
                live_grep_args = {
                      auto_quoting = true,
                      mappings = {
                        i = {
                          ["<C-a>"] = lga_actions.quote_prompt({ postfix = " --hidden --no-ignore " }),
                          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                          ["<C-space>"] = lga_actions.to_fuzzy_refine,
                        },
                      },
                }
            },
        }

        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})

        vim.keymap.set('n', '<leader>fw', live_grep_args_shortcuts.grep_word_under_cursor, {})
        vim.keymap.set('v', '<leader>fv', live_grep_args_shortcuts.grep_visual_selection, {})

        vim.keymap.set('n', '<leader>fl', ':lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>', {})
        vim.keymap.set('n', '<leader>fp', function()
            require('telescope').extensions.file_browser.file_browser({
                respect_gitignore = false,
                hidden = true,
                initial_mode = 'normal',
                dir_icon = '',
                path = '%:p:h'
            })
        end, {})

        vim.keymap.set('n', '<leader>fa', function()
            builtin.find_files({
                no_ignore = true,
                hidden = true
            })
        end, {})

        vim.keymap.set('n', '<leader>fr', function()
            builtin.resume({
                initial_mode = 'normal',
            })
        end, {})

        telescope.load_extension 'fzf'
        telescope.load_extension 'live_grep_args'
        telescope.load_extension 'neoclip'
        telescope.load_extension 'file_browser'
    end
}
