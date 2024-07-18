-- bootstrapping
local wezterm = require 'wezterm'
local config = {}

-- actual config
config.font = wezterm.font('BerkeleyMono Nerd Font')
config.font_size = 20
config.color_scheme = 'Kanagawa (Gogh)'
config.enable_tab_bar = false
config.window_background_opacity = 0.95
config.window_decorations = 'RESIZE'
config.window_close_confirmation = 'NeverPrompt'

return config
