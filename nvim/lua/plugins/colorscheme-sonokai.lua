return {
    {
        "sainnhe/sonokai",
        lazy = false,
        priority = 1000,
        config = function()
            -- Styles:
            -- "atlantis",
            -- "andromeda",
            -- "shusia",
            -- "maia",
            -- "espresso"
            vim.g.sonokai_style = "espresso"
            vim.cmd([[colorscheme sonokai]])
        end,
    },
}
