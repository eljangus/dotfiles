return {
    -- lazygit in a float, themed to match the colorscheme
    {
        "folke/snacks.nvim",
        opts = { lazygit = {} },
        keys = {
            { "<leader>gg", function() Snacks.lazygit() end,          desc = "Lazygit" },
            { "<leader>gl", function() Snacks.lazygit.log() end,      desc = "Git log" },
            { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Git log (file)" },
            { "<leader>gB", function() Snacks.gitbrowse() end,        desc = "Open in browser", mode = { "n", "x" } },
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            on_attach = function(buf)
                local gs = require("gitsigns")
                local map = function(mode, lhs, rhs, desc) vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc }) end

                -- ]h / [h, so äh / öh on QWERTZ
                map("n", "]h", function() gs.nav_hunk("next") end, "Next hunk")
                map("n", "[h", function() gs.nav_hunk("prev") end, "Prev hunk")

                map("n", "<leader>gs", gs.stage_hunk, "Stage hunk")
                map("n", "<leader>gr", gs.reset_hunk, "Reset hunk")
                map("x", "<leader>gs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
                    "Stage lines")
                map("x", "<leader>gr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
                    "Reset lines")
                map("n", "<leader>gS", gs.stage_buffer, "Stage buffer")
                map("n", "<leader>gp", gs.preview_hunk_inline, "Preview hunk")
                map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame line")
                map("n", "<leader>gd", gs.diffthis, "Diff file")
                map({ "o", "x" }, "ih", gs.select_hunk, "Inside hunk")
            end,
        },
    },
}
