return {
    'nvim-telescope/telescope.nvim', 
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { "<leader>ff", 
            "<cmd>Telescope find_files<cr>", 
            desc = "Find Files" 
        },

        { "<leader>fs",
            function() 
                require("telescope.builtin").grep_string({ search = vim.fn.input("string > ") });  
            end, 
            desc = "Find In Files" 
        },

        { "<leader>gd",
            function() 
                require("telescope.builtin").lsp_definitions({});
            end,
            desc = "Find In Files"
        },
    }
}

