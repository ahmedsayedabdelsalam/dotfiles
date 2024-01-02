local M = {}

-- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "yaml",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "vue",
    "markdown",
    "markdown_inline",
    "php",
    "ruby",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "prettier",
    "emmet-ls",
    "tailwindcss-language-server",
    "vue-language-server",

    -- php stuff
    "phpactor",

    -- ruby stuff
    "solargraph",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
