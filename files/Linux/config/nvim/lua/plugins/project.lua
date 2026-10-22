return {
    'DrKJeff16/project.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    cmd = 'Project',
    keys = {
        { '<leader>pp', '<cmd>Project telescope<cr>', desc = 'Switch project' },
    },
    opts = {
        -- only cd when a project is picked, never on BufEnter
        manual_mode = true,
    },
    config = function(_, opts)
        require('project').setup(opts)
        require('telescope').load_extension('projects')
    end,
}
