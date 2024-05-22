return {
  -- popup notification
  {
    "rcarriga/nvim-notify",
    config = function()
      local notify = require "notify"
      notify.setup {
        -- this for transparency
        background_colour = "#000000",
        top_down = false,
        render = 'wrapped-compact',
        -- level = vim.log.levels.WARN
      }
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
