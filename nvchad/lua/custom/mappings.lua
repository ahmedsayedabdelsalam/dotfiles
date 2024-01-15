---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    }
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
