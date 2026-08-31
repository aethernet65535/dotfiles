return {
    {
        "folke/snacks.nvim",
        opts = {},
        keys = {
            {
                "<leader>ff",
                function()
                    Snacks.picker.files()
                end,
                desc = "Find Files (Snacks)",
            },
            {
                "<leader>fs",
                function()
                    Snacks.picker.grep()
                end,
                desc = "Grep / Search String (Snacks)",
            },
        },
    },
}
