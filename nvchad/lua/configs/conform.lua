local util = require("conform.util")

local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },
    -- css = { "prettier" },
    -- html = { "prettier" },
    php = { "pint" },
    blade = { "blade-formatter", "rustywind" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },

  formatters = {
    injected = { options = { ignore_errors = true } },
    pint = {
      meta = {
        url = "https://github.com/laravel/pint",
        description = "Laravel Pint is an opinionated PHP code style fixer for minimalists. Pint is built on top of PHP-CS-Fixer and makes it simple to ensure that your code style stays clean and consistent.",
      },
      command = util.find_executable({
        vim.fn.stdpath("data") .. "/mason/bin/pint",
        "vendor/bin/pint",
      }, "pint"),
      args = { "$FILENAME" },
      stdin = false,
    },
  }
}

require("conform").setup(options)
