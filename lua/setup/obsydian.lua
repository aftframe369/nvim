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

    ui = {
      enable = true,         -- set to false to disable all additional syntax features
      update_debounce = 200, -- update delay after a text change (in milliseconds)
      checkboxes = {
        [" "] = { hl_group = "ObsidianTodo" },
        ["x"] = { hl_group = "ObsidianDone" },
        [">"] = { hl_group = "ObsidianRightArrow" },
        ["~"] = { hl_group = "ObsidianTilde" },

      },
      reference_text = { hl_group = "ObsidianRefText" },
      highlight_text = { hl_group = "ObsidianHighlightText" },
      tags = { hl_group = "ObsidianTag" },
      hl_groups = {
        -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
        ObsidianTodo = { bold = true, fg = "#f78c6c" },
        ObsidianDone = { bold = true, fg = "#89ddff" },
        ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
        ObsidianTilde = { bold = true, fg = "#ff5370" },
        ObsidianBullet = { bold = true, fg = "#89ddff" },
        ObsidianRefText = { underline = true, fg = "#c792ea" },
        ObsidianExtLinkIcon = { fg = "#c792ea" },
        ObsidianTag = { italic = true, fg = "#89ddff" },
        ObsidianHighlightText = { bg = "#75662e" },
      },
    },

  },
  init = function()
    vim.api.nvim_create_user_command("Obsydian", ':e  ~/Dokumenty/kisling/',  {desc='open obsidian notes directory'})
    vim.api.nvim_create_user_command("ObsydianUlubiona", ":!ln -s \"%:p\" \"/home/maciej/Dokumenty/kisling/00 ulubione/%:t\"", {})
  end
}
