return {
    -- start screen; buttons go through telescope
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local dashboard = require("alpha.themes.dashboard")
            local button = function(key, text, cmd)
                local b = dashboard.button(key, text, cmd)
                b.opts.hl = "AlphaButtons"
                b.opts.hl_shortcut = "AlphaShortcut"
                return b
            end
            dashboard.section.buttons.val = {
                button("f", "\u{f002}  Find File", "<cmd>Telescope find_files<cr>"),
                button("n", "\u{f15b}  New File", "<cmd>ene | startinsert<cr>"),
                button("g", "\u{f022}  Find Text", "<cmd>Telescope live_grep<cr>"),
                button("r", "\u{f0c5}  Recent Files", "<cmd>Telescope oldfiles<cr>"),
                button("p", "\u{f07b}  Projects", "<cmd>lua require('config.projects')()<cr>"),
                button("c", "\u{f423}  Config", "<cmd>lua require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('config') })<cr>"),
                button("l", "\u{f04b2}  Lazy", "<cmd>Lazy<cr>"),
                button("q", "\u{f426}  Quit", "<cmd>qa<cr>"),
            }
            -- the Alpha* groups are what colorschemes theme; fall back to generic ones
            local function fallback_hl()
                for group, link in pairs({ AlphaHeader = "Type", AlphaButtons = "Normal", AlphaShortcut = "Keyword", AlphaFooter = "Comment" }) do
                    vim.api.nvim_set_hl(0, group, { link = link, default = true })
                end
            end
            fallback_hl()
            vim.api.nvim_create_autocmd("ColorScheme", { callback = fallback_hl })
            dashboard.section.header.opts.hl = "AlphaHeader"
            dashboard.section.footer.opts.hl = "AlphaFooter"

            -- the stock logo is indented by 3 columns, which pushes it right of the buttons;
            -- without it it's 50 wide, same as the button column, so both share one center
            local header = dashboard.section.header.val
            local indent = math.huge
            for _, line in ipairs(header) do
                if line:find("%S") then indent = math.min(indent, #line:match("^ *")) end
            end
            for i, line in ipairs(header) do header[i] = line:sub(indent + 1) end

            -- center vertically: header, gap, buttons (each followed by a blank line), footer
            local gap = 2
            local height = #header + gap + 2 * #dashboard.section.buttons.val + 1
            -- measure alpha's own window, not the current one: alpha also redraws while
            -- a telescope float is focused, which would collapse the padding
            local function win_height()
                for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
                    if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == "alpha" then
                        return vim.api.nvim_win_get_height(win)
                    end
                end
                return vim.fn.winheight(0)
            end
            dashboard.config.layout = {
                { type = "padding", val = function() return math.max(2, math.floor((win_height() - height) / 2)) end },
                dashboard.section.header,
                { type = "padding", val = gap },
                dashboard.section.buttons,
                dashboard.section.footer,
            }
            require("alpha").setup(dashboard.config)

            -- startup time in the footer
            vim.api.nvim_create_autocmd("User", {
                pattern = "LazyVimStarted",
                once = true,
                callback = function()
                    local stats = require("lazy").stats()
                    local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
                    dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"
                    pcall(vim.cmd.AlphaRedraw)
                end,
            })
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = { "BufReadPost", "BufNewFile" },
        -- scope stays highlighted on the bar; drop the underlines at its start/end lines
        opts = { scope = { show_start = false, show_end = false } },
    },
    {
        "karb94/neoscroll.nvim",
        event = "VeryLazy",
        opts = {},
    },
    -- toast popups, noice routes messages here
    {
        "rcarriga/nvim-notify",
        lazy = true,
        opts = {},
    },
    -- terminal split at the bottom; 2<A-t> etc. opens a second one
    {
        "akinsho/toggleterm.nvim",
        cmd = "ToggleTerm",
        keys = {
            { "<leader>t", "<cmd>exe v:count1 . 'ToggleTerm'<cr>", desc = "Terminal" },
            { "<A-t>",     desc = "Terminal", mode = { "n", "t" } },
        },
        opts = {
            open_mapping = [[<A-t>]],
            insert_mappings = false,
            size = 15,
        },
    },
    {
        "famiu/bufdelete.nvim",
        cmd = { "Bdelete", "Bwipeout" },
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
                disabled_filetypes = { statusline = { "alpha" } },
            },
        },
    },
    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy",
        opts = {
            options = {
                close_command = function(n) require("bufdelete").bufdelete(n) end,
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
        dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
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
