return {
  {
    "honza/vim-snippets",
    config = function()
      require("luasnip.loaders.from_snipmate").lazy_load()
    end,
  },
  {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip").filetype_extend("ruby", { "rails" })
    end,
  },
}
