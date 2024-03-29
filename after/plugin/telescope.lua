require("telescope").load_extension("fzf")
require("telescope").load_extension("recent_files")

vim.api.nvim_set_keymap("n", "<C-p>",
  [[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]],
  {noremap = true, silent = true})


local builtin = require("telescope.builtin")

vim.keymap.set("n", "<Leader>F", builtin.find_files, {})
vim.keymap.set("n", "<C-f>", builtin.find_files, {})
vim.keymap.set("n", "<Leader>f", builtin.git_files, {})
vim.keymap.set("c", "Rg", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
