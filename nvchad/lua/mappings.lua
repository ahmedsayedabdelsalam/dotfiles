require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- keep visual mode when indeinting
map("v", ">", ">gv", { desc = "indent forward" })
map("v", "<", "<gv", { desc = "indent backword" })

-- terminal mappings
map({ "n", "t" }, "<leader>tt", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "Toggle horizontal term" })
map({ "n", "t" }, "<leader>tf", function()
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

map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

map("n", "<leader>cr", "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })

map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>ss", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

map("n", "<leader>lf", vim.diagnostic.open_float, { desc = "lsp diagnostic float" })
