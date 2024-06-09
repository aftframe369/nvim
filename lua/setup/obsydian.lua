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
        path = "~/Dokumenty/kisling/",
      },
    },
    disable_frontmatter = true,

    daily_notes = {
      folder = "Logi",
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

  init = function()
    vim.api.nvim_create_user_command("Obsydian", ':e  ~/Dokumenty/kisling/', { desc = 'open obsidian notes directory' })
    vim.api.nvim_create_user_command("ObsydianUlubiona",
      ":!ln -s \"%:p\" \"/home/maciej/Dokumenty/kisling/00 ulubione/%:t\"", {})
    vim.api.nvim_create_user_command("ObsydianToday",
      ':cd ~/Dokumenty/kisling| e TODO.md | ObsidianToday',
      { desc = "Todays note" })
  end
}
