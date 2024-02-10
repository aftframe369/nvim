return {
  "epwalsh/obsidian.nvim",
  lazy = true,
  version = '*',
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "kisling",
        path = "~/Dokumenty/Kisling/",
      },
    },

    daily_notes = {
      folder = "logi",
    },

    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle check-boxes.
      ["<leader>ch"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
    },
    note_id_func = function(title)
      return title
    end,

  },
}
