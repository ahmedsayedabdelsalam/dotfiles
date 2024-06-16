return {
  "okuuva/auto-save.nvim",
  cmd = "ASToggle", -- optional for lazy loading on command
  event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
  keys = {
    { "<leader>ua", ":ASToggle<CR>", desc = "Toggle auto-save" },
  },
  opts = {
    -- your config goes here
    -- or just leave it empty :)
  },
}
