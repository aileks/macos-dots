-- bootstrapping
local wezterm = require 'wezterm'
local colors = require('lua/monokai-pro-octagon').colors()
local window_frame = require('lua/monokai-pro-octagon').window_frame()
local config = {}

-- actual config
config.font = wezterm.font("Rec Mono Duotone")
config.font_size = 18.0
config.colors = colors
config.colors.selection_fg = '#b2b9bd'
config.colors.selection_bg = '#33374b'
config.window_frame = window_frame
config.window_background_opacity = 0.95
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"

return config
