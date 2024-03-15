return {
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = { enable = true },
    },
  },

  -- add live_grep_args
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    opts = {
      extensions = {
        live_grep_args = {
          auto_quoting = true,  -- random example from the README
        },
      },
      extensions_list = {
        "live_grep_args",
        -- NvChad defaults
        "themes",
        "terms",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",

        -- web dev stuff
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "prettier",
        "emmet-ls",
        "tailwindcss-language-server",
        "rustywind",
        "vue-language-server",
        "blade-formatter",
        "pint",

        -- php stuff
        "intelephense",
        "phpstan",

        -- ruby stuff
        "solargraph",
      },
    },
  },

  {
    "jwalton512/vim-blade",
  },
}
