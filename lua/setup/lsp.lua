--Global lsp shortcuts and config
local remap = vim.keymap.set
local modes = { 'n', 'v', 'x' }
remap(modes, '<leader>lh', function()
    if (vim.diagnostic.is_disabled()) then
      vim.diagnostic.enable()
    else
      vim.diagnostic.disable()
    end
  end,
  { desc = '[L]SP [H]ide' })
remap(modes, '<leader>lm', vim.diagnostic.open_float, { desc = '[L]SP float [M]essages' })
vim.diagnostic.config(
  {
    virtual_text = false,
    float = {
      source = true,
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

require('setup.nvimcmp')

require 'lspconfig'.pyright.setup({
  on_attach = on_attach,
  settings = {
    pyright = { autoImportCompletion = true, },
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = 'openFilesOnly',
        useLibraryCodeForTypes = true,
        typeCheckingMode = 'on'
      }
    }
  }
})

require 'lspconfig'.ruff_lsp.setup({
  on_attach = on_attach,
  init_options = {
    settings = {
      -- Any extra CLI arguments for `ruff` go here.
      args = {},
    }
  }
})

require 'lspconfig'.emmet_ls.setup({
  -- on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
  init_options = {
    html = {
      options = {
        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
        ["bem.enabled"] = true,
      },
    },
  }
})

local null_ls = require("null-ls")

null_ls.setup({
  on_attach = on_attach,
  sources = {
    -- null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.formatting.prettier.with({
      filetypes = { "html", "json", "yaml", "markdown" },
    }),
    null_ls.builtins.formatting.clang_format.with({
      extra_args = { "-style=", "{IndentWidth: 4}" }
    }),
    null_ls.builtins.formatting.sql_formatter.with({
      extra_args = { "-c", vim.fn.expand("~/.config/nvim/packages/sql_config.json") }
    }),
  },
})
require("none-ls-autoload").setup({
  external_sources = {
    'none-ls-external-sources.formatting.autopep8',
  }

})
