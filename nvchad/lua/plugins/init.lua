return {
  -- git
  {
    "lewis6991/gitsigns.nvim",
    opts = function()
      return vim.tbl_deep_extend("force", require "nvchad.configs.gitsigns", require "configs.gitsigns")
    end,
  },

  -- sidebar tree files and folders
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = { enable = true },
    },
  },

  -- take screenshot of code
  {
    "mistricky/codesnap.nvim",
    build = "make",
    keys = {
      { "<leader>sc", ":CodeSnap<CR>", mode = "v" },
    },
  },
}
