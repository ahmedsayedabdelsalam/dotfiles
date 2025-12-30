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

-- Copy relative path with line number (normal mode)
vim.keymap.set("n", "<leader>fC", function()
  local path = vim.fn.expand("%") .. ":" .. vim.fn.line(".")
  vim.fn.setreg("+", path)
  vim.notify("Copied: " .. path, vim.log.levels.INFO)
end, { desc = "Copy file path with line number" })

-- Copy relative path with line range (visual mode)
vim.keymap.set("v", "<leader>fC", function()
  local start_line = vim.fn.line("v")
  local end_line = vim.fn.line(".")

  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end

  local path = vim.fn.expand("%") .. ":" .. start_line .. "-" .. end_line
  vim.fn.setreg("+", path)
  vim.notify("Copied: " .. path, vim.log.levels.INFO)
end, { desc = "Copy file path with line range" })
