return {
  {
    "javiorfo/nvim-springtime",
    lazy = true,
    cmd = { "Springtime", "SpringtimeUpdate" },
    dependencies = {
      "javiorfo/nvim-popcorn",
      "javiorfo/nvim-spinetta",
      "hrsh7th/nvim-cmp",
    },
    build = function()
      require("springtime.core").update()
    end,
    opts = {
      -- Some popup options
      dialog = {
        -- The keymap used to select radio buttons (normal mode)
        selection_keymap = "<Space>",

        -- The keymap used to generate the Spring project (normal mode)
        generate_keymap = "<C-CR>",

        -- If you want confirmation before generate the Spring project
        confirmation = false,
      },
      internal = {
        log_debug = true,
      },
    },
  },
}
