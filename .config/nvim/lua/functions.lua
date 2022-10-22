local M = {}
local telescope_builtin = require('telescope.builtin')

-- Taken from https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#falling-back-to-find_files-if-git_files-cant-find-a-git-directory
M.open_project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(telescope_builtin.git_files, opts)
  if not ok then telescope_builtin.find_files(opts) end
end

return M
