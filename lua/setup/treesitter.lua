-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'java', 'rust', 'tsx', 'typescript', 'html', 'vimdoc', 'vim' },

  -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
  auto_install = false,
  sync_install = false,

  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm

        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = false, -- whether to set jumps in the jumplist

      goto_next_start = {
        -- [']]'] = "@.*.inner"
      },

      goto_next_end = {
        -- [']]'] = "@function.outer",

      },
      goto_previous_start = {
        -- ['[['] = "@function.inner",
      },

      goto_previous_end = {
        -- ['[['] = "@function.inner",
      },
    },
    swap = {
      enable = true,
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
    },
  },
}
