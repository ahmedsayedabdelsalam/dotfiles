-- Pull in the wezterm API
local wezterm = require("wezterm")
local mux = wezterm.mux

-- This will hold the configuration.
local config = wezterm.config_builder()
local b = require("utils.background")
local assets = wezterm.config_dir .. "/assets"
local transparent = true

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.colors = {
-- 	foreground = "#CBE0F0",
-- 	background = "#011423",
-- 	cursor_bg = "#47FF9C",
-- 	cursor_border = "#47FF9C",
-- 	cursor_fg = "#011423",
-- 	selection_bg = "#706b4e",
-- 	selection_fg = "#f3d9c4",
-- 	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
-- 	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
-- }

config.color_scheme = 'Catppuccin Mocha'
if transparent then
  config.background = {
    b.get_background(true, 0.7),
    b.get_animation(assets .. "/blob_blue.gif"),
  }
config.window_background_opacity = 0.8
config.macos_window_background_blur = 30
end


config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 14

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

-- start fullscreen
wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

-- start with zellij
-- config.default_prog = { "zellij", "-l", "welcome" }

-- and finally, return the configuration to wezterm
return config
