---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

-- more keybinds!

M.nvterm = {
  t = {
     ["<leader>tt"] = {
      function () require("nvterm.terminal").toggle('horizontal') end,
       "Toggle horizontal term",
     },
   },

  n = {
     ["<leader>tt"] = {
      function () require("nvterm.terminal").toggle('horizontal') end,
       "Toggle horizontal term",
     },
   },
 }

return M
