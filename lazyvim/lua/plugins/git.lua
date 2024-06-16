return {
  -- git blame and signs
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
  },

  -- conflicts
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = true,
  },
}
