---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "bearded-arc",
  theme_toggle = { "bearded-arc", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  -- The below code for those using nvimtree on the right side and want the offset on right.
  -- tabufline = {
  --   overriden_modules = function(modules)
  --      table.insert(modules, modules[1])
  --      table.remove(modules,1)
  --   end,
  -- },

  nvdash = {
    load_on_startup = true,
    header = {
      '     _____  .__                       .___   _________                       .___',
      '    /  _  \\ |  |__   _____   ____   __| _/  /   _____/____  ___.__. ____   __| _/',
      '   /  /_\\  \\|  |  \\ /     \\_/ __ \\ / __ |   \\_____  \\\\__  \\<   |  |/ __ \\ / __ | ',
      '  /    |    \\   Y  \\  Y Y  \\  ___// /_/ |   /        \\/ __ \\\\___  \\  ___// /_/ | ',
      '  \\____|__  /___|  /__|_|  /\\___  >____ |  /_______  (____  / ____|\\___  >____ | ',
      '          \\/     \\/      \\/     \\/     \\/          \\/     \\/\\/         \\/     \\/ ',
    }
  }
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
