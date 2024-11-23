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

        telescope.setup {
            defaults = {
                mappings = {
                    i = {
                        ['<C-k>'] = require('telescope.actions').cycle_history_next,
                        ['<C-j>'] = require('telescope.actions').cycle_history_prev,
                    },
                    n = {
                        ['<C-k>'] = require('telescope.actions').cycle_history_next,
                        ['<C-j>'] = require('telescope.actions').cycle_history_prev,
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
            },
        }


        local builtin = require('telescope.builtin')
        local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")

        function find_files_all()
            builtin.find_files({ find_command = {'rg', '--files', '--no-ignore', '--hidden'} })
        end

        function telescope_file_browser()
            require('telescope').extensions.file_browser.file_browser({
                respect_gitignore = false,
                hidden = true,
                initial_mode = 'normal',
                dir_icon = '',
                path = '%:p:h'
            })
        end


        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})

        vim.keymap.set('n', '<leader>fr', function()
            require('telescope.builtin').resume({
                initial_mode = 'normal',
            })
        end, {})

        vim.keymap.set('n', '<leader>fw', live_grep_args_shortcuts.grep_word_under_cursor, {})
        vim.keymap.set('v', '<leader>fv', live_grep_args_shortcuts.grep_visual_selection, {})
        vim.keymap.set('n', '<leader>fa', ':lua find_files_all()<CR>', {})

        vim.keymap.set('n', '<leader>fl', ':lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>', {})
        vim.keymap.set('n', '<leader>fp', ':lua telescope_file_browser()<CR>', {})

        telescope.load_extension 'fzf'
        telescope.load_extension 'live_grep_args'
        telescope.load_extension 'neoclip'
        telescope.load_extension 'file_browser'
    end
}
