-- Disable Auto-format for C files
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp", "h", "hpp" },
    callback = function()
        vim.b.autoformat = false
    end,
})
