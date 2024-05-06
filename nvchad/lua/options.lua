require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!

-- Folding --
o.foldmethod     = 'expr'
o.foldexpr       = 'v:lua.vim.treesitter.foldexpr()'
o.foldenable = false -- zi toggles
-- opt.foldlevel = 99

-- Filetypes --
vim.filetype.add({
  extension = {
    keymap = 'dts',
    neon = 'yaml',
    overlay = 'dts',
  },
  pattern = {
    -- ['.*%.blade%.php'] = 'blade.html.php',
    -- ['.*%.blade%.php'] = 'html.blade.php',
    ['.*%.antlers%.html'] = 'antlers.html',
    ['.*%.blade%.php'] = 'blade',
    ['.*%.neon%.dist'] = 'yaml',
  },
})
