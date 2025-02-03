local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- FONTS
config.color_scheme = 'OneDark (base16)'
config.font = wezterm.font 'Iosevka Nerd Font Mono'
config.font_size = 14

-- Default to powershell
config.default_prog = {'powershell', '-NoLogo'}

return config