vim.opt.guicursor = ""

-- autowrite
vim.opt.autowrite = true
vim.opt.autowriteall = true

-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- tabs
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- linewrap
vim.opt.wrap = false

--backup
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- search
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- split preferences
vim.opt.splitright = true
vim.opt.splitbelow = true

-- on save clear trailing whitespace
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- save on focus change
vim.api.nvim_create_autocmd({"FocusLost", "BufLeave"}, {
  pattern = { "*" },
  command = "silent! wa",
})

-- Enable transparent background
vim.cmd [[highlight Normal guibg=NONE]]
vim.cmd [[highlight NonText guibg=NONE]]

-- let g:gruvbox_transparent_bg = 1
--

vim.api.nvim_create_user_command('So', function()
  vim.cmd('source ' .. vim.fn.stdpath('config') .. '/init.lua')
end, {})

