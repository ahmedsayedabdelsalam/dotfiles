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

M.telescope = {
  n = {
    ["<leader>f."] = {
      function()
        require("telescope").extensions.live_grep_args.live_grep_args {
          vimgrep_arguments = {
            "rg",
            "--hidden",
            -- NvChad defaults
            "-L",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
        }
      end,
      "Live grep, including hidden files",
    },
  },
}

return M
