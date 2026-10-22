return {
    -- {
    --     "nyoom-engineering/oxocarbon.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     build = false,
    --     config = function()
    --         -- oxocarbon makes Title/Special plain grey, so the dashboard gets its own accents
    --         vim.api.nvim_create_autocmd("ColorScheme", {
    --             pattern = "oxocarbon",
    --             callback = function()
    --                 vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#be95ff" }) -- purple
    --                 vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = "#3ddbd9" })   -- cyan
    --                 vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = "#ff7eb6" })    -- pink
    --                 vim.api.nvim_set_hl(0, "SnacksDashboardFooter", { fg = "#525252" })
    --             end,
    --         })
    --         vim.opt.background = "dark"
    --         vim.cmd.colorscheme("oxocarbon")
    --     end,
    -- },
    -- Using Lazy
    {
        "navarasu/onedark.nvim",
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require('onedark').setup {
                style = 'warmer'
            }
            require('onedark').load()
        end
    }
}
