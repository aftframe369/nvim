return {
  'stevearc/oil.nvim',
  opts = {
    skip_confirm_for_simple_edits = true,
    signcolumn = "yes",
    columns = {
      "icon",
    },
    keymaps = {
      ["~"] = function() vim.api.nvim_command(":edit ~/") end,
      ["ge"] = "actions.open_external",
      ["yp"] = "actions.yank_entry",
      }
  }
}
