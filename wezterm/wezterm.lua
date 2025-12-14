local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- config.font = wezterm.font("Lilex Nerd Font")
config.font_size = 13.5


config.enable_tab_bar = false
config.window_decorations = "RESIZE"


config.window_background_opacity = 0.95
config.macos_window_background_blur = 20

local schemes = {}

for name, _ in pairs(wezterm.get_builtin_color_schemes()) do
  table.insert(schemes, name)
end

math.randomseed(os.time())

local current_scheme = nil
wezterm.on('random-theme', function (window, _)
  local scheme = schemes[math.random(#schemes)]

  while scheme == current_scheme do
    scheme = schemes[math.random(#schemes)]
  end
  current_scheme = scheme

  window:set_config_overrides({
    color_scheme = scheme,
    window:toast_notification("WezTerm", "Theme: " ..scheme, nil, 2000)
  })
end)

config.keys = {
  {
    key = 't',
    mods = "CTRL",
    action = wezterm.action.EmitEvent("random-theme"),
  }
}

config.default_cursor_style = "BlinkingUnderline"
config.cursor_blink_rate = 100

return config
