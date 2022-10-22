local map = vim.api.nvim_set_keymap
local silent = { silent = false, noremap = true }

-- map('n', '<leader>g', [[<cmd>Telescope git_files theme=get_dropdown<cr>]], silent)
map('n', '<leader>g', [[<cmd>Telescope git_files<cr>]], silent)
