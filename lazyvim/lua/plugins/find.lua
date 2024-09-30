return {
  {
    "princejoogie/dir-telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      {
        "<leader>fd",
        "<cmd>Telescope dir live_grep<CR>",
        noremap = true,
        silent = true,
        desc = "Find in dir",
      },
    },
  },
}
