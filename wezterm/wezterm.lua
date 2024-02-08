-- bootstrapping
local wezterm = require 'wezterm'
local colors = require('lua/rose-pine').colors()
local window_frame = require('lua/rose-pine').window_frame()
local config = {}

-- actual config
config.font = wezterm.font("RecMonoLinear Nerd Font")
config.font_size = 16.0
config.colors = colors
config.window_frame = window_frame
config.window_background_opacity = 0.90
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"

return config
