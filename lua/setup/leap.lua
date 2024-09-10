local function func()
  local remap = vim.keymap.set
  local modes = { 'n', 'x', 'o' }

  remap(modes, 's', '<Plug>(leap-forward-to)')
  remap(modes, 'gs', '<Plug>(leap-backward-to)')
  vim.api.nvim_set_hl(0, 'LeapLabel', {link="Search", bold=true})

end
return func
