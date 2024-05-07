return {
  -- popup notification
  {
    "rcarriga/nvim-notify",
    config = function()
      local notify = require "notify"
      -- this for transparency
      notify.setup { background_colour = "#000000" }
      -- this overwrites the vim notify function
      vim.notify = notify.notify
    end,
  },

  -- ignore empty messages
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      routes = {
        {
          filter = {
            event = "notify",
            find = "No information available",
          },
          opts = {
            skip = true,
          },
        },
      },
      -- your other opts
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
}
