return {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    opts = {
        defaults = {
            mappings = {
                i = {
                    ['<C-j>'] = 'move_selection_next',
                    ['<C-k>'] = 'move_selection_previous',
                },
            },
        },
    },
    cmd = 'Telescope',
    keys = {
        { '<leader>ff', function() require('telescope.builtin').find_files() end, desc = 'Telescope find files' },
        { '<leader>fg', function() require('telescope.builtin').live_grep() end,  desc = 'Telescope live grep' },
        { '<leader>fb', function() require('telescope.builtin').buffers() end,    desc = 'Telescope buffers' },
        { '<leader>fh', function() require('telescope.builtin').help_tags() end,  desc = 'Telescope help tags' },
        { '<leader>fH', function()
            require('telescope.builtin').find_files({
                cwd = vim.env.HOME,
                hidden = true,
                file_ignore_patterns = {
                    '%.git/', '%.cache/', '%.local/share/', 'node_modules/',
                    '%.config/vesktop/', '%.config/zen/', '%.cargo/', '%.nuget/',
                    '^%.backup/', '%.config/r2modman', '%.vscode%-oss/', -- r2modman also covers r2modmanPlus-local
                    '^tmp/', -- ~/tmp, browse it with <leader>. instead
                },
            })
        end, desc = 'Telescope find files in ~' },
    },
}
