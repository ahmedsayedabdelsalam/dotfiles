return {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, {

      -- php stuff
      "intelephense",
      "phpactor",
      "phpstan",
      "php-debug-adapter",
    })
  end,
}
