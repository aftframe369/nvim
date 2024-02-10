local function func()
  local remap=vim.keymap.set
  local modes = {'n', 'x', 'o'}

  remap(modes, 's', '<Plug>(leap-forward-to)')
  remap(modes, 'gs', '<Plug>(leap-backward-to)')
  
end
return func
