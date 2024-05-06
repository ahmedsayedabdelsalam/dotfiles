return {
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
      "phpactor",
      "phpstan",
      "php-debug-adapter",

      -- ruby stuff
      "solargraph",

      -- c++ stuff
      "clangd",
      "clang-format",
      "codelldb"
    },
  },
}
