-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("i", "jj", "<ESC>")



-- enable/disable copilot completion
local Snacks = require("snacks")
local copilot_exists = pcall(require, "copilot")

if copilot_exists then
  Snacks.toggle({
    name = "Copilot Completion",
    color = {
      enabled = "azure",
      disabled = "orange",
    },
    get = function()
      return not require("copilot.client").is_disabled()
    end,
    set = function(state)
      if state then
        require("copilot.command").enable()
      else
        require("copilot.command").disable()
      end
    end,
  }):map("<leader>at")
end


-- display git conflicts in snacks picker
vim.keymap.set("n", "<leader>gc", function()
  vim.cmd("GitConflictListQf")
  vim.cmd("cclose")
  require("snacks.picker").qflist({
    title = "Git Conflicts",
  })
end, { desc = "Git conflicts" })
