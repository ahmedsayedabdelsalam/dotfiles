return {
  "nvim-treesitter/nvim-treesitter",
  opts = { ensure_installed = { "blade", "php_only" } },
  config = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      opts.ensure_installed = LazyVim.dedup(opts.ensure_installed)
    end

    ---@class ParserInfo[]
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = {
          "src/parser.c",
          -- 'src/scanner.cc',
        },
        branch = "main",
        generate_requires_npm = true,
        requires_generate_from_grammar = true,
      },
      filetype = "blade",
    }

    require("nvim-treesitter.configs").setup(opts)
  end,
}
