M = {}

M.opts = {
icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "->", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
        ellipsis = "…",
        -- set to false to disable all mapping icons,
        -- both those explicitly added in a mapping
        -- and those from rules
        mappings = false,
        --- See `lua/which-key/icons.lua` for more details
        --- Set to `false` to disable keymap icons from rules
        ---@type wk.IconRule[]|false
        rules = {},
        -- use the highlights from mini.icons
        -- When `false`, it will use `WhichKeyIcon` instead
        colors = true,
        -- used by key format
        keys = {
          Up = "up",
          Down = "down",
          Left = "left",
          Right = "right",
          C = "C-",
          M = "Meta",
          D = "D",
          S = "S",
          CR = "CR",
          Esc = "ESC",
          ScrollWheelDown = "scrollup",
          ScrollWheelUp = "scrolldown",
          NL = "newline",
          BS = "backspace",
          Space = "<space>",
          Tab = "<Tab>",
          F1 = "F1",
          F2 = "F2",
          F3 = "F3",
          F4 = "F4",
          F5 = "F5",
          F6 = "F6",
          F7 = "F7",
          F8 = "F8",
          F9 = "F9",
          F10 = "F10",
          F11 = "F11",
          F12 = "F12",
        },
      }
}

return M
