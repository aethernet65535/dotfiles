return {
    {
        "mason-org/mason.nvim",
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, {
                "clangd",
                "kotlin-language-server",
                "pyright",
            })
        end,
    },

    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                clangd = {
                    cmd = { "clangd", "--background-index", "--clang-tidy" },
                },
                ["kotlin-language-server"] = {},
                pyright = {},
            },
        },
    },
}
