-- bootstrapping
local wezterm = require 'wezterm'
local config = {}

-- actual config
config.font = wezterm.font("RecMonoLinear Nerd Font")
config.font_size = 16.0
config.color_scheme = "Monokai Soda (Gogh)"
config.window_background_opacity = 0.90
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"

return config
