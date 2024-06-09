return {
  'stevearc/oil.nvim',
  opts = {
    skip_confirm_for_simple_edits = true,
    signcolumn = "yes",
    columns = {
      "icon",
    },
    keymaps = {
      ["ge"] = "actions.open_external",
    }
  }
}
