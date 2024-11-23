return {
  {
    "nvim-java/nvim-java",
    config = false,
    dependencies = {
      {
        "neovim/nvim-lspconfig",
        opts = {
          servers = {
            -- Your JDTLS configuration goes here
            jdtls = {
              settings = {
                -- java = {
                --   configuration = {
                --     runtimes = {
                --       {
                --         name = "JavaSE-23",
                --         path = "/usr/local/sdkman/candidates/java/23-tem",
                --       },
                --     },
                --   },
                -- },
              },
            },
          },
          setup = {
            jdtls = function()
              -- Your nvim-java configuration goes here
              require("java").setup({
                jdk = {
                  auto_install = false,
                },
              })
            end,
          },
        },
      },
    },
  },

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
