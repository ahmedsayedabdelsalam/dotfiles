-- we're using laravel pint with conform instead
return {
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      for i = #opts.sources, 1, -1 do
        local source = opts.sources[i]
        if source.name == "phpcs" or source.name == "phpcsfixer" then
          table.remove(opts.sources, i)
        end
      end
    end,
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    config = function(_, opts)
      opts.linters_by_ft.php = {}
    end,
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "V13Axel/neotest-pest",
    },
    opts = {
      loog_level = vim.log.levels.DEBUG,
      adapters = {
        ["neotest-pest"] = {},
      },
    },
  },
}
