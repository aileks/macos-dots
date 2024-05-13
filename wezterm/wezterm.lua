-- bootstrapping
local wezterm = require 'wezterm'
local config = {}

-- actual config
config.font = wezterm.font('MonoLisa', { weight = 'Medium' })
config.font_size = 14
config.color_scheme = 'Catppuccin Mocha'
config.enable_tab_bar = false
config.window_background_opacity = 0.95
config.window_decorations = 'RESIZE'
config.window_close_confirmation = 'NeverPrompt'

return config
