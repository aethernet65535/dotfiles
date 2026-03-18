local opt = vim.opt

opt.nu = true
opt.relativenumber = false

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true

opt.wrap = true

opt.scrolloff = 5

opt.autoread = true

opt.colorcolumn = "81"

opt.clipboard = "unnamedplus"

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true
-- opt.cursorcolumn = true

local indent_settings_group = vim.api.nvim_create_augroup("CustomIndentSettings", { clear = true })

-- low-level
vim.api.nvim_create_autocmd("FileType", {
    group = indent_settings_group,
    pattern = { "c", "cpp" },
    callback = function()
        vim.opt_local.tabstop = 8
        vim.opt_local.shiftwidth = 8
        vim.opt_local.softtabstop = 8
        vim.opt_local.expandtab = false
    end,
})

-- others
vim.api.nvim_create_autocmd("FileType", {
    group = indent_settings_group,
    pattern = { "lua", "sh" },
    callback = function()
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
        vim.opt_local.softtabstop = 4
        vim.opt_local.expandtab = true
    end,
})
