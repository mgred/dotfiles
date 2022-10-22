local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  completion = { completeopt = 'menu,menuone,noinsert' },
  -- window = {
  --     documentation = {
  --         border = vim.g.floating_window_border_dark,
  --     },
  --     completion = {
  --         border = vim.g.floating_window_border_dark,
  --     },
  -- },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  experimental = {
      ghost_text = true,
  },
  mapping = cmp.mapping.preset.insert({
    ['<c-d>'] = cmp.mapping.scroll_docs(-4),
    ['<c-u>'] = cmp.mapping.scroll_docs(4),
    ['<c-Space>'] = cmp.mapping.complete(),
    ['<c-j>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<c-k>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<c-e>'] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ['<cr>'] = cmp.mapping.confirm({ select = true }),
  }),
  -- mapping = cmp.mapping.preset.insert({
  --   ['<c-d>'] = cmp.mapping.scroll_docs(-4),
  --   ['<c-u>'] = cmp.mapping.scroll_docs(4),
  --   ['<c-Space>'] = cmp.mapping.complete(),
  --   ['<c-j>'] = cmp.mapping.select_next_item(),
  --   ['<c-k>'] = cmp.mapping.select_prev_item(),
  --   ['<c-e>'] = cmp.mapping {
  --     i = cmp.mapping.abort(),
  --     c = cmp.mapping.close(),
  --   },
  --   ['<cr>'] = cmp.mapping.confirm({ select = true }),
  -- }),
  sources = {
    { name = 'nvim_lsp_signature_help' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'nvim_lua' },
    { name = 'path' },
    { name = 'buffer' },
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. strings[1] .. " "
      kind.menu = "    (" .. strings[2] .. ")"
  
      return kind
    end,
  },
})

cmp.setup.cmdline('/', {
  sources = cmp.config.sources({
    { name = 'nvim_lsp_document_symbol' }
  }, {
    { name = 'buffer' }
  })
})

local cmdline_mappings = {
  select_next_item = {
    c = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert } 
    -- c = function(fallback)
    --     if cmp.visible() then
    --         return cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }(fallback)
    --     else
    --         return cmp.mapping.complete { reason = cmp.ContextReason.Auto }(fallback)
    --     end
    -- end,
},
  select_prev_item = {
    c = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
  },
}

cmp.setup.cmdline(':', {
  sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } }),
  mapping = {
    ['<C-j>'] = cmdline_mappings.select_next_item,
    ['<C-k>'] = cmdline_mappings.select_prev_item,
    ['<cr>'] = { c = cmp.mapping.confirm({ select = true }) },
  },
  preselect = cmp.PreselectMode.None,
})
