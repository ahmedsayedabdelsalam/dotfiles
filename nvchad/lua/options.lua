require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!

-- Folding --
o.foldmethod     = 'expr'
o.foldexpr       = 'v:lua.vim.treesitter.foldexpr()'
o.foldenable = false -- zi toggles
-- opt.foldlevel = 99

