local opt = vim.opt

opt.nu = true
opt.relativenumber = false

opt.tabstop = 8
opt.softtabstop = 8
opt.shiftwidth = 8

opt.smartindent = true

opt.wrap = true

opt.scrolloff = 5

opt.autoread = true

opt.colorcolumn = "120"

opt.clipboard = "unnamedplus"

opt.ignorecase = true
opt.smartcase = true

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  command = "setlocal tabstop=8 shiftwidth=8 softtabstop=8 noexpandtab",
})

