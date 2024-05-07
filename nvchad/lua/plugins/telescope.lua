return {
  -- to enable find in files with advanced options
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    config = function()
      require("telescope").setup {
        extensions = {
          live_grep_args = {
            auto_quoting = true, -- random example from the README
          },
          extensions_list = {
            "live_grep_args",
          },
        },
      }
    end,
  },

  -- popup telescope code actions
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {},
          },
        },
      }
      require("telescope").load_extension "ui-select"
    end,
  },
}
