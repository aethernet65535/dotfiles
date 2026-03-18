return {
    {
        "rcarriga/nvim-notify",
        opts = {
            render = "wrapped-compact",
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            options = {
                theme = "everforest",
                section_separators = "",
                component_separators = "",
            },
            sections = {
                lualine_c = {
                    {
                        "filename",
                        path = 3, -- 0: filename-only,
                        -- 1: relative path
                        -- 2: absolute path
                        -- 3: absolute but home = ~
                    },
                },
            },
            inactive_sections = {
                lualine_c = { { "filename", path = 2 } },
            },
        },
    },
}
