-- [[ Configure nvim-cmp ]]
-- See `:help cmp`

local cmp = require 'cmp'
-- local luasnip = require 'luasnip'
-- require('luasnip.loaders.from_vscode').lazy_load()
-- luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      -- luasnip.lsp_expand(args.body)
    end,
  },
  -- completion = {
  --   completeopt = 'menu,menuone,noinsert'
  -- },

  mapping = cmp.mapping.preset.insert {
    ['J'] = cmp.mapping.select_next_item(),
    ['K'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-u>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.insert,
      select = true,
    },
    ['L'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.insert,
      select = false,
    },
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'ultisnips' },
    -- { name = 'luasnip' },
  },
}

cmp.event:on(
  'confirm_done',
  require('nvim-autopairs.completion.cmp').on_confirm_done()
)
