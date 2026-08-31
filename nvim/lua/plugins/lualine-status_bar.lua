return {
    {
        "nvim-lualine/lualine.nvim",
        opts = function(_, opts)
            opts.options.theme = "everforest"
            opts.options.section_separators = ""
            opts.options.component_separators = ""

            opts.sections.lualine_c = {
                {
                    "filename",
                    path = 3,
                },
                opts.sections.lualine_c[2] or "diagnostics",
            }

            opts.sections.lualine_x = {
                "wakatime",
                { "filetype", icon_only = false },
                unpack(opts.sections.lualine_x or {}),
            }

            opts.sections.lualine_y = {
                "location",
            }

            opts.sections.lualine_z = {}

            opts.inactive_sections = {
                lualine_c = { { "filename", path = 2 } },
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            }

            return opts
        end,
    },
}
