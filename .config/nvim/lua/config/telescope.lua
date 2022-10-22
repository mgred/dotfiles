local telescope = require('telescope')
local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<c-j>"] = actions.move_selection_next,
        ["<c-k>"] = actions.move_selection_previous,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
    heading = {
      treesitter = true,
    }
  },
  pickers = {
    buffers = {
      ignore_current_buffer = true,
      sort_lastused = true,
    },
    find_files = {
      -- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#remove--from-fd-results
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
    },
  },
})

telescope.load_extension('fzf')
telescope.load_extension('heading')
