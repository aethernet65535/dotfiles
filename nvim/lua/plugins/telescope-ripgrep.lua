return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        {
            "<leader>ff",
            "<cmd>Telescope find_files<cr>",
            desc = "Find Files",
        },

        {
            "<leader>fs",
            function()
                require("telescope.builtin").grep_string({ search = vim.fn.input("ripgrep > ") })
            end,
            desc = "Find In Files",
        },
    },
}
