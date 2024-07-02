return {
  "neovim/nvim-lspconfig",
  opts = {
    -- @type lspconfig.options
    servers = {
      emmet_ls = {
        filetypes = {
          "astro",
          "blade",
          "css",
          "eruby",
          "html",
          "htmldjango",
          "javascriptreact",
          "less",
          "pug",
          "sass",
          "scss",
          "svelte",
          "typescriptreact",
          "vue",
        },

        intelephense = {
          filetypes = { "php", "blade" },
          settings = {
            intelephense = {
              filetypes = { "php", "blade" },
              files = {
                associations = { "*.php", "*.blade.php" }, -- Associating .blade.php files as well
                maxSize = 5000000,
              },
            },
          },
        },

        tailwindcss = {
          -- add additional filetypes to the default_config
          filetypes_include = { "blade" },
        },
      },

      solargraph = {
        autostart = false,
      },
      ruby_lsp = {},
    },
  },
}
