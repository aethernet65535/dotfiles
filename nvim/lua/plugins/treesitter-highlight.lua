return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = { 
                "c",
                "lua",
                "vim"
            },
            highlight = { 
                enable = true 
            },
            indent = { 
                enable = true 
            },
        },
        config = function(_, opts)
            local status, ts_configs = pcall(require, "nvim-treesitter.configs")
            if status then
                ts_configs.setup(opts)
            end
        end,
    },
}
