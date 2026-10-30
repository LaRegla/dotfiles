-- init shi
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

--when opening wezterm, start it fullscreen
wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():toggle_fullscreen()
end)

-- when not focued set background to be lighter
wezterm.on('window-focus-changed', function(window, pane)
  if window:is_focused() then
    window:set_config_overrides({
      window_background_opacity = 1.0,
    })
  else
    window:set_config_overrides({
      window_background_opacity = 0.7,
    })
  end
end)


-- Set the default domain to boot directly into WSL
config.default_domain = 'WSL:Ubuntu'

-- Color Scheme
config.color_scheme = 'Vibrant Ink(Gogh)'

-- Background color to black
config.colors = {
	background = '#000000'
}

--window padding
config.window_padding = {
  left = "1cell",
  right = "1cell",
  top = "0.33cell",
  bottom = 0,
}

-- remove tab bar
config.enable_tab_bar = false

-- return filled out config
return config
