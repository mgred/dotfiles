local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

lspconfig['tsserver'].setup {
  capabilities = capabilities
}

-- local map = vim.keymap.set
-- local buffer = vim.lsp.buf
-- local diagnostic = vim.diagnostic
--
-- local opts = { noremap=true, silent=true }
-- map('n', '<space>e', diagnostic.open_float, opts)
-- map('n', '[d', diagnostic.goto_prev, opts)
-- map('n', ']d', diagnostic.goto_next, opts)
-- map('n', '<space>q', diagnostic.setloclist, opts)
--
-- -- Use an on_attach function to only map the following keys
-- -- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)
--   -- Enable completion triggered by <c-x><c-o>
--   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--
--   -- Mappings.
--   -- See `:help vim.lsp.*` for documentation on any of the below functions
--   local bufopts = { noremap=true, silent=true, buffer=bufnr }
--   map('n', 'gD', buffer.declaration, bufopts)
--   map('n', 'gd', buffer.definition, bufopts)
--   map('n', 'K', buffer.hover, bufopts)
--   map('n', 'gi', buffer.implementation, bufopts)
--   map('n', '<C-k>', buffer.signature_help, bufopts)
--   map('n', '<space>wa', buffer.add_workspace_folder, bufopts)
--   map('n', '<space>wr', buffer.remove_workspace_folder, bufopts)
--   map('n', '<space>wl', function()
--     print(vim.inspect(buffer.list_workspace_folders()))
--   end, bufopts)
--   map('n', '<space>D', buffer.type_definition, bufopts)
--   map('n', '<space>rn', buffer.rename, bufopts)
--   map('n', '<space>ca', buffer.code_action, bufopts)
--   map('n', 'gr', buffer.references, bufopts)
--   map('n', '<space>f', buffer.formatting, bufopts)
-- end
--
-- local lsp_flags = {
--   -- This is the default in Nvim 0.7+
--   debounce_text_changes = 150,
-- }
--
-- lspconfig['tsserver'].setup {
--   lsp_flags = lsp_flags,
--   on_attach = on_attach,
-- }
--
