-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "bearded-arc",
  transparency = true,

  hl_override = {
    NvDashAscii = {
      fg = 'white',
      bg = 'NONE',
    },
    NvDashButtons = {
      bg = 'NONE',
    },
  },

  -- fix: https://github.com/NvChad/NvChad/issues/1656
  lsp = { signature = false },

  nvdash = {
    load_on_startup = true,
    header = {
      -- ' ░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓██████████████▓▒░░▒▓████████▓▒░▒▓███████▓▒░        ░▒▓███████▓▒░░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░▒▓███████▓▒░  ',
      -- '░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░ ',
      -- '░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░ ',
      -- '░▒▓████████▓▒░▒▓████████▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓██████▓▒░ ░▒▓█▓▒░░▒▓█▓▒░       ░▒▓██████▓▒░░▒▓████████▓▒░░▒▓██████▓▒░░▒▓██████▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ',
      -- '░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░             ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░   ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░ ',
      -- '░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░             ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░   ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░ ',
      -- '░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░▒▓███████▓▒░       ░▒▓███████▓▒░░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░   ░▒▓████████▓▒░▒▓███████▓▒░  ',


      -- '     _____  .__                       .___   _________                       .___',
      -- '    /  _  \\ |  |__   _____   ____   __| _/  /   _____/____  ___.__. ____   __| _/',
      -- '   /  /_\\  \\|  |  \\ /     \\_/ __ \\ / __ |   \\_____  \\\\__  \\<   |  |/ __ \\ / __ | ',
      -- '  /    |    \\   Y  \\  Y Y  \\  ___// /_/ |   /        \\/ __ \\\\___  \\  ___// /_/ | ',
      -- '  \\____|__  /___|  /__|_|  /\\___  >____ |  /_______  (____  / ____|\\___  >____ | ',
      -- '          \\/     \\/      \\/     \\/     \\/          \\/     \\/\\/         \\/     \\/ ',


      ' █████╗ ██╗  ██╗███╗   ███╗███████╗██████╗     ███████╗ █████╗ ██╗   ██╗███████╗██████╗ ',
      '██╔══██╗██║  ██║████╗ ████║██╔════╝██╔══██╗    ██╔════╝██╔══██╗╚██╗ ██╔╝██╔════╝██╔══██╗',
      '███████║███████║██╔████╔██║█████╗  ██║  ██║    ███████╗███████║ ╚████╔╝ █████╗  ██║  ██║',
      '██╔══██║██╔══██║██║╚██╔╝██║██╔══╝  ██║  ██║    ╚════██║██╔══██║  ╚██╔╝  ██╔══╝  ██║  ██║',
      '██║  ██║██║  ██║██║ ╚═╝ ██║███████╗██████╔╝    ███████║██║  ██║   ██║   ███████╗██████╔╝',
      '╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚═════╝     ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═════╝ ',
    }
  }
}

return M
