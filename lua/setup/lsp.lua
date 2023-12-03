--Global lsp shortcuts and config
local remap = vim.keymap.set
local modes = {'n', 'v', 'x'}
remap(modes, '<leader>lh', function()
    if (vim.diagnostic.is_disabled()) then vim.diagnostic.enable() else vim.diagnostic.disable()
    end
  end,
  {desc='[L]SP [H]ide'})
remap(modes, '<leader>lm', vim.diagnostic.open_float, {desc='[L]SP float [M]essages'})
vim.diagnostic.config(
{
    virtual_text=false,
    float = {
      source=true,
    }
}
)


-- LSP settings.
local on_attach = require('setup.lsp_onattach')
-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Enable the following language servers
local servers = {
  -- clangd = {},
  -- gopls = {},
  pyright = {},
  -- rust_analyzer = {},
  -- tsserver = {},
  -- jedi_language_server = {},

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
};
-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  mapping = cmp.mapping.preset.insert {
    ['J'] = cmp.mapping.select_next_item(),
    ['K'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.insert,
      select = false,
    },
    ['L'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.insert,
      select = false,
    },
    ['Tab'] = cmp.mapping(
      -- Because youre using smart-tab 
      -- you can now smart tab out of strings
      -- even if they are being completed
      function()
        cmp.abort()
        vim.api.nvim_feedkeys('<Tab>', 'i')
      end
    )
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

require 'lspconfig'.pyright.setup {
  on_attach = on_attach,
  settings = {
    pyright = { autoImportCompletion = true, },
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = 'openFilesOnly',
        useLibraryCodeForTypes = true,
        typeCheckingMode = 'off'


      } } } };

local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.ruff,
    null_ls.builtins.formatting.autopep8,
    null_ls.builtins.formatting.clang_format.with({ extra_args = { "-style=", '"{IndentWidth: 4}"' } }),
    null_ls.builtins.diagnostics.sqlfluff,
    null_ls.builtins.formatting.sqlfmt,
    -- null_ls.builtins.diagnostics.sqlfluff,
  },
})



