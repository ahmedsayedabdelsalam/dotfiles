local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.prettier,
  b.formatting.blade_formatter,

  -- Ruby
  b.formatting.rubocop,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
