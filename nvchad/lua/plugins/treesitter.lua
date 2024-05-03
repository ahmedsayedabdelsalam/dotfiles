return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      -- defaults 
      "vim",
      "lua",
      "vimdoc",
      "bash",

      -- web dev 
      "html",
      "css",
      "javascript",
      "typescript",
      "tsx",
      "vue",
      "php",
      "php_only",
      "ruby",
      "blade",

     -- low level
      "c",
      "cpp",
      "zig"
    },
  },
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      opts = {
        custom_calculation = function(_, language_tree)
          if vim.bo.filetype == "blade" and language_tree._lang ~= "javascript" and language_tree._lang ~= "php" then
            return "{{-- %s --}}"
          end
        end,
      },
    },
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function(_, opts)
    -- config override to support blade
    dofile(vim.g.base46_cache .. "syntax")
    dofile(vim.g.base46_cache .. "treesitter")
    require("nvim-treesitter.configs").setup(opts)

    local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
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
  end,
}
