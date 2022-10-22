local g = vim.g
local map = vim.api.nvim_set_keymap
local silent = { silent = true, noremap = true }

g.mapleader = ';'

-- Escape
map('i', 'jk', '<esc>', silent)

-- Save & Quit
map('n', '<leader>w', '<cmd>w<cr>', silent)
map('n', '<leader>aw', '<cmd>wa<cr>', silent)
map('n', '<leader>q', '<cmd>wq<cr>', silent)
map('n', '<leader>aq', '<cmd>wqa<cr>', silent)
map('n', '<leader>x', '<cmd>q!<cr>', silent)
map('n', '<leader>ax', '<cmd>qa!<cr>', silent)
map('i', '<c-s>', '<esc><cmd>w<cr>a', silent)

-- Buffers
map('n', '<c-n>', '<cmd>bnext<cr>', silent)
map('n', '<c-p>', '<cmd>bprev<cr>', silent)

-- Windows
map('n', '<c-h>', '<c-w>h', silent)
map('n', '<c-j>', '<c-w>j', silent)
map('n', '<c-k>', '<c-w>k', silent)
map('n', '<c-l>', '<c-w>l', silent)

-- Yanking
map('n', 'Y', 'y$', silent)

-- Misc
map('n', '<leader>n', '<cmd>:nohlsearch<cr>', silent)

-- Telescope
map('n', '<leader>j', [[<cmd>Telescope buffers show_all_buffers=true<cr>]], silent)
map('n', '<leader>f', [[<cmd>Telescope find_files<cr>]], silent)
map('n', '<leader>h', [[<cmd>Telescope heading<cr>]], silent)
map('n', '<c-f>', [[<cmd>lua require('functions').open_project_files()<cr>]], silent)

-- Goyo
map('n', '<c-g>', '<cmd>ZenMode<cr>', silent)
map('i', '<c-g>', '<esc><cmd>ZenMode<cr>a', silent)

-- Trouble
map('n', '<c-t>', '<cmd>TroubleToggle<cr>', silent)
map('i', '<c-t>', '<cmd>TroubleToggle<cr><esc><cmd>TroubleRefresh<cr>', silent)
map('n', '<leader>tw', '<cmd>TroubleToggle workspace_diagnostics<cr>', silent)
map('n', '<leader>td', '<cmd>TroubleToggle document_diagnostics<cr>', silent)
map('n', '<leader>tl', '<cmd>TroubleToggle loclist<cr>', silent)
map('n', '<leader>tq', '<cmd>TroubleToggle quickfix<cr>', silent)
map('n', '<leader>tr', '<cmd>TroubleToggle lsp_references<cr>', silent)
