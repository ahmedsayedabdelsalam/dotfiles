local h = require("utils.helpers")
local wezterm = require("wezterm")
local M = {}

M.get_default_theme = function()
  return h.is_dark and "Catppuccin Mocha" or "Catppuccin Latte"
end

M.get_background = function(is_dark, dark, light)
  is_dark = is_dark or h.is_dark
  dark = dark or 0.85
  light = light or 0.9

  return {
    source = {
      Gradient = {
        colors = { is_dark and "#000000" or "#ffffff" },
      },
    },
    width = "100%",
    height = "100%",
    opacity = is_dark and dark or light,
  }
end

M.get_wallpaper = function(wallpaper)
  return {
    source = { File = { path = wallpaper } },
    height = "Cover",
    width = "Cover",
    horizontal_align = "Center",
    repeat_x = "NoRepeat",
    repeat_y = "NoRepeat",
    opacity = 1,
  }
end

M.get_animation = function(animation)
  return {
    source = {
      File = {
        path = animation,
        speed = 0.001,
      },
    },
    repeat_x = "NoRepeat",
    repeat_y = "NoRepeat",
    vertical_align = "Middle",
    width = "100%",
    height = "Cover",
    opacity = 0.10,
    hsb = {
      hue = 0.9,
      saturation = 0.8,
      brightness = 0.1,
    },
  }
end

return M
