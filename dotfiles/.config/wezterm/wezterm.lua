local wezterm = require("wezterm")

return {
  color_scheme = "Catppuccin Mocha", -- or Macchiato, Frappe, Latte
  hide_tab_bar_if_only_one_tab = true,
  font = wezterm.font({
    family = "MonoLisa2 Nerd Font",
    weight = "Medium",
    harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
  }),
  font_size = 14.0,
  font_rules = {
    -- Bold
    {
      intensity = "Bold",
      italic = false,
      font = wezterm.font("MonoLisa2 Nerd Font", {
        weight = "Bold",
        stretch = "Normal",
      }),
    },
    -- Bold and italic
    {
      intensity = "Bold",
      italic = true,
      font = wezterm.font("MonoLisa2 Nerd Font", {
        weight = "Bold",
        style = "Italic",
      }),
    },
  },
  keys = {
    {
      key = "k",
      mods = "CMD",
      action = wezterm.action.SendKey { key = "l", mods = "CTRL" },
    }
  },
}