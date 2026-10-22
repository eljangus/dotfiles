-- language servers
local servers = { "clangd", "pyright", "ts_ls", "lua_ls", "qmlls" }

return {
    {
        "saghen/blink.cmp",
        version = "1.*",
        event = "InsertEnter",
        opts = {
            keymap = {
                preset = "none",
                ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
                ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
                ["<C-CR>"] = { "accept", "fallback" },
                ["<C-e>"] = { "hide", "fallback" },
                ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
                ["<C-n>"] = { "select_next", "fallback" },
                ["<C-p>"] = { "select_prev", "fallback" },
                ["<C-b>"] = { "scroll_documentation_up", "fallback" },
                ["<C-f>"] = { "scroll_documentation_down", "fallback" },
            },
            completion = {
                list = { selection = { preselect = true, auto_insert = true } },
                documentation = { auto_show = true },
            },
            signature = { enabled = true },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
                per_filetype = { lua = { inherit_defaults = true, "lazydev" } },
                providers = {
                    lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 },
                },
            },
        },
    },
    -- knows about vim.* and plugin types when editing this config
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } },
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "saghen/blink.cmp" },
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities() })
            -- brew's qt keeps qmlls in opt/qt/bin, which isn't on PATH
            vim.lsp.config("qmlls", { cmd = { "/opt/homebrew/opt/qt/bin/qmlls" } })

            -- only enable what's installed, so a missing server stays quiet
            for _, name in ipairs(servers) do
                local cmd = vim.lsp.config[name].cmd
                if type(cmd) ~= "table" or vim.fn.executable(cmd[1]) == 1 then
                    vim.lsp.enable(name)
                end
            end

            vim.diagnostic.config({
                severity_sort = true,
                virtual_text = { spacing = 2, prefix = "●" },
                float = { border = "rounded" },
            })

            -- nvim already maps K, grn, gra, grr, gri and gO
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local buf = args.buf
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    local map = function(lhs, rhs, desc) vim.keymap.set("n", lhs, rhs, { buffer = buf, desc = desc }) end

                    map("gd", vim.lsp.buf.definition, "Goto definition")
                    map("gD", vim.lsp.buf.declaration, "Goto declaration")
                    map("<leader>ca", vim.lsp.buf.code_action, "Code action")
                    map("<leader>cr", vim.lsp.buf.rename, "Rename")
                    map("<leader>cf", function() vim.lsp.buf.format({ bufnr = buf }) end, "Format")
                    map("<leader>cd", vim.diagnostic.open_float, "Line diagnostics")

                    -- format on save; one per buffer so :lsp restart doesn't stack them
                    if client and client:supports_method("textDocument/formatting") then
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = vim.api.nvim_create_augroup("lsp_format_" .. buf, { clear = true }),
                            buffer = buf,
                            callback = function() vim.lsp.buf.format({ bufnr = buf }) end,
                        })
                    end
                end,
            })
        end,
    },
}
