return {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    keys = {
        -- start in the current file's folder; <bs> on an empty prompt goes up
        { '<leader>.', '<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>', desc = 'Find file (browser)' },
    },
    config = function()
        require('telescope').load_extension('file_browser')
    end,
}
