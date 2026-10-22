-- main branch: parsers are built with the tree-sitter CLI (brew install tree-sitter-cli)
return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").install({
            "bash", "c", "cpp", "css", "fish", "javascript", "json", "kdl", "lua",
            "markdown", "markdown_inline", "python", "qmljs", "toml", "typescript",
            "vim", "vimdoc", "yaml",
        })
        -- highlight with treesitter wherever a parser exists
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args) pcall(vim.treesitter.start, args.buf) end,
        })
    end,
}
