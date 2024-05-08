return {
  -- git blame and signs
  {
    "lewis6991/gitsigns.nvim",
    opts = function()
      return vim.tbl_deep_extend("force", require "nvchad.configs.gitsigns", require "configs.gitsigns")
    end,
  },

  -- conflicts
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = true,
    lazy = false, -- find a better way to make it lazy
  },
}
