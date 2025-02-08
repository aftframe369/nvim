return function()
vim.api.nvim_create_user_command("TableGridMode", function ()
  vim.b.table_mode_motion_up_map = ''
  vim.b.table_mode_motion_down_map = ''
  vim.b.table_mode_motion_left_map = ''
  vim.b.table_mode_motion_right_map = ''
  vim.b.table_mode_auto_border = 1
  vim.b.table_mode_disable_tableize_mappings = 1
  vim.b.table_mode_corner='+'
  vim.b.table_mode_corner_corner='+'
  vim.b.table_mode_header_fillchar='='
  end, {desc="grid tablesj"}
  )
vim.api.nvim_create_user_command("TableDefualtMode", function ()
  vim.b.table_mode_motion_up_map = ''
  vim.b.table_mode_motion_down_map = ''
  vim.b.table_mode_motion_left_map = ''
  vim.b.table_mode_motion_right_map = ''
  vim.b.table_mode_auto_border = 1
  vim.b.table_mode_disable_tableize_mappings = 1
  vim.b.table_mode_corner_corner='|'
  end, {desc="default_tables"}
  )

vim.api.nvim_create_user_command("TableSwitchFillchar", function ()
    if vim.b.table_mode_header_fillchar == "=" then
      vim.fn.execute("s/-/=/g")
      vim.fn.execute("s/|/+/g")
    else
      vim.fn.execute("s/=/-/g")
      vim.fn.execute("s/+/|/g")
    end

  end, {desc = "switch - to == and == to -"})

  vim.keymap.set("n", "<leader>ts", ":TableSwitchFillchar<CR>", {desc="switch fillchar"})

  vim.g.table_mode_delimiter = "\t"
  vim.g.table_mode_motion_up_map = ''
  vim.g.table_mode_motion_down_map = ''
  vim.g.table_mode_motion_left_map = ''
  vim.g.table_mode_motion_right_map = ''
  vim.g.table_mode_auto_border = 1
  vim.g.table_mode_disable_tableize_mappings = 1
  vim.g.table_mode_corner_corner='|'
end

