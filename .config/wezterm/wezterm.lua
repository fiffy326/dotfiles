local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.default_prog = { '/usr/bin/bash' }
config.window_background_opacity = 0.85
config.color_scheme = 'Material Palenight (base16)'
config.font = wezterm.font('FiraCode Nerd Font', { weight = 'Regular' })
config.font_size = 12.0

return config

-- vim:set ts=4 sts=4 sw=4:
