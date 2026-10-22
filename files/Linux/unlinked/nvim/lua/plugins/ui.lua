-- always in the project switcher, next to every git repo opened in nvim
local pinned = { "~/dotfiles", "~/Uni", "~/org", "~/.config/quickshell/Lily" }

-- project switcher
local function projects()
    local list = {}
    for _, dir in ipairs(pinned) do
        dir = vim.fs.normalize(dir)
        if vim.fn.isdirectory(dir) == 1 then -- skip what this machine doesn't have
            list[#list + 1] = dir
        end
    end
    Snacks.picker.projects({
        projects = list,
        -- cd into it, then find a file with telescope
        confirm = function(picker, item)
            picker:close()
            if item then
                vim.fn.chdir(item.file)
                require("telescope.builtin").find_files()
            end
        end,
    })
end

return {
    -- dashboard, animated indent guides, smooth scrolling
    {
        "folke/snacks.nvim",
        lazy = false,
        priority = 1000,
        keys = {
            { "<leader>pp", projects,                         desc = "Switch project" },
            -- terminal split at the bottom; 2<A-t> etc. opens a second one
            { "<leader>t",  function() Snacks.terminal() end, desc = "Terminal" },
            { "<A-t>",      function() Snacks.terminal() end, desc = "Terminal",         mode = { "n", "t" } },
        },
        opts = {
            dashboard = {
                preset = {
                    keys = {
                        { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                        { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                        { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                        { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                        { icon = " ", key = "p", desc = "Projects", action = projects },
                        { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                        { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
                        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                    },
                },
                sections = {
                    { section = "header" },
                    { section = "keys",   gap = 1, padding = 1 },
                    { section = "startup" },
                },
            },
            indent = { enabled = true },
            scroll = { enabled = true },
            notifier = { enabled = true }, -- toast popups, noice routes messages here
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy",
        opts = {
            options = {
                theme = "auto",
                globalstatus = true,
                -- powerline arrows, as escapes so the nerd font glyphs survive editing
                section_separators = { left = "\u{e0b0}", right = "\u{e0b2}" },
                component_separators = { left = "\u{e0b1}", right = "\u{e0b3}" },
                disabled_filetypes = { statusline = { "snacks_dashboard" } },
            },
        },
    },
    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy",
        opts = {
            options = {
                close_command = function(n) Snacks.bufdelete(n) end,
                always_show_bufferline = false,
                offsets = {
                    { filetype = "neo-tree", text = "Explorer", highlight = "Directory", text_align = "left" },
                },
            },
        },
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        cmd = "Neotree",
        -- load early when started on a directory, so neo-tree opens instead of netrw
        init = function()
            vim.api.nvim_create_autocmd("BufEnter", {
                group = vim.api.nvim_create_augroup("neotree_start_dir", { clear = true }),
                callback = function()
                    if vim.fn.isdirectory(vim.fn.expand("%:p")) == 1 then
                        vim.api.nvim_del_augroup_by_name("neotree_start_dir")
                        require("neo-tree")
                    end
                end,
            })
        end,
        keys = {
            { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Explorer" },
        },
        opts = {
            close_if_last_window = true,
            window = { width = 37 },
            filesystem = {
                follow_current_file = { enabled = true },
                use_libuv_file_watcher = true,
            },
        },
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            preset = "helix",
            spec = {
                { "<leader>b", group = "buffer" },
                { "<leader>c", group = "code" },
                { "<leader>f", group = "find" },
                { "<leader>g", group = "git" },
                { "<leader>p", group = "project" },
                { "<leader>w", group = "window" },
            },
        },
    },
    -- : opens in a centered popup instead of the bottom line
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = {
            presets = {
                bottom_search = true,   -- / and ? stay at the bottom
                command_palette = true, -- cmdline and its completion menu together
                long_message_to_split = true,
                lsp_doc_border = true,
            },
            lsp = {
                signature = { enabled = false }, -- blink.cmp shows signatures already
            },
        },
    },
}
