-- just override to support blade files
return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  tag = "v0.9.2",
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate",
  opts = function()
    return require "plugins.configs.treesitter"
  end,
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "syntax")
    require("nvim-treesitter.configs").setup(opts)

    local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = {"src/parser.c"},
        branch = "main",
      },
      filetype = "blade"
    }
  end,
}
