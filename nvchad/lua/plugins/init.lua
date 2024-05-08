return {
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
