function func()
  local remap = vim.keymap.set
  remap('n', 'Sc', '<Plug>Csurround')
  remap('n', 'Sd', '<Plug>Dsurround')
  remap('n', 'S', '<Plug>Ysurround')
end
return func

