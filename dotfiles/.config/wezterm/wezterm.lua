local wezterm = require("wezterm");

return {
  color_scheme = "Catppuccin Mocha", -- or Macchiato, Frappe, Latte
  font = wezterm.font({
    family = "MonoLisa2 Nerd Font",
    harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
  }),
  font_size = 14.0,
  keys = {
    -- Map Command + K to clear the screen
    {
      key = "k",
      mods = "CMD",
      action = wezterm.action.SendString("clear\n"),
    },
  },
}
