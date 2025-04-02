local cmp = require 'cmp'

Light_sources = {
  { name = 'nvim_lsp' },
}

Heavy_sources = {
  { name = 'ultisnips' },
  { name = 'nvim_lsp' },
}

if not vim.g.Chromebook then
  Sources = Heavy_sources
else
  Sources = Light_sources
end

cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
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
  sources = Sources
}

vim.api.nvim_create_user_command("UltiSnipsSwitch", function()
    if vim.b.Ultisnips == nil or vim.b.Ultisnips == false then
      cmp.setup.buffer {
        sources = Heavy_sources
      }
      vim.b.Ultisnips = true
    else
      cmp.setup.buffer {
        sources = Light_sources
      }
      vim.b.Ultisnips = false
    end
  end,
  { desc = "load ultisnips" }
)


cmp.event:on(
  'confirm_done',
  require('nvim-autopairs.completion.cmp').on_confirm_done()
)
