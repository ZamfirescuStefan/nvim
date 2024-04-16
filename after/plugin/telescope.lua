local telescope = require('telescope')

telescope.setup {
    defaults = {
        mappings = {
            i = {
                ['<C-j>'] = require('telescope.actions').cycle_history_next,
                ['<C-k>'] = require('telescope.actions').cycle_history_prev,
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
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fw', builtin.grep_string, {})
vim.keymap.set('n', '<leader>fa', ':lua find_files_all()<CR>', {})

vim.keymap.set('n', '<leader>fl', ':lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>', {})
vim.keymap.set('n', '<leader>fp', ':lua telescope_file_browser()<CR>', {})

telescope.load_extension 'fzf'
telescope.load_extension 'live_grep_args'
telescope.load_extension 'neoclip'
telescope.load_extension 'file_browser'
