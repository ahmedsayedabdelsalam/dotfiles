return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    auto_install = true,
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

     -- low level
      "c",
      "cpp",
      "zig"
    },
    autotag = { -- 'windwp/nvim-ts-autotag'
      enable = false, -- this breaks dot repeating with `>`
    },
    endwise = { -- 'RRethy/nvim-treesitter-endwise',
      enable = true,
    },
    textobjects = { -- 'nvim-treesitter/nvim-treesitter-textobjects',
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ['if'] = '@function.inner',
          ['af'] = '@function.outer',
          ['ic'] = '@class.inner',
          ['ac'] = '@class.outer',
          ['il'] = '@loop.inner',
          ['al'] = '@loop.outer',
          ['ia'] = '@parameter.inner',
          ['aa'] = '@parameter.outer',
        },
      },
    },
  },
  dependencies = {
    "windwp/nvim-ts-autotag",
    "RRethy/nvim-treesitter-endwise",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-context",
  },
  config = function(_, opts)
    -- config override to support blade
    dofile(vim.g.base46_cache .. "syntax")
    dofile(vim.g.base46_cache .. "treesitter")

    local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
    parser_config.blade = {
      install_info = {
        url = "https://github.com/EmranMR/tree-sitter-blade",
        files = {
          "src/parser.c",
          -- 'src/scanner.cc',
        },
        generate_requires_npm = true,
        requires_generate_from_grammar = true,
      },
      filetype = "blade",
    }
    require("nvim-treesitter.configs").setup(opts)
  end,
}
