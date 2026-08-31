return {
    "saghen/blink.cmp",
    opts = {
        sources = {
            default = { "lsp", "path", "snippets" },
            providers = {
                lsp = {
                    transform_items = function(_, items)
                        return vim.tbl_filter(function(item)
                            return item.kind ~= 1
                        end, items)
                    end,
                },
            },
        },
    },
}
