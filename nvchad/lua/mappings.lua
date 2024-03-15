require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
  require("conform").format()
end, { desc = "File Format with conform" })

map("i", "jj", "<ESC>", { desc = "Escape insert mode" })

-- custom

-- keep visual mode when indeinting
map("v", ">", ">gv", { desc = "indent forward" })
map("v", "<", "<gv", { desc = "indent backword" })

-- terminal mappings
map({ "n", "t" }, "<leader>tt", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm", size = 0.3 }
end, { desc = "Toggle horizontal term" })
map({ "n", "t" }, "<leader>ft", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "Terminal Toggle Floating term" })

-- live grep with args
map("n", "<leader>f.", function()
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
end, { desc = "Live grep, including hidden files" })
