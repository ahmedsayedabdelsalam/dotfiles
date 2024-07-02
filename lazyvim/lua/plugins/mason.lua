return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, {
      -- web dev stuff
      "html-lsp",
      "emmet-ls",
      "css-lsp",

      -- php stuff
      "intelephense",
      "phpstan",
      "pint",
      "blade-formatter",

      -- ruby stuff
      "ruby-lsp",
    })
  end,
}
