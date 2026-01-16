if status is-login
	if test -z "$DISPLAY"; and test (tty) = "/dev/tty1"
		exec startx
	end
end

if status is-interactive
	set -xg XDG_CONFIG_HOME $HOME/.config
	set -xg XDG_DATA_HOME $HOME/.local/share
	set -xg XDG_STATE_HOME $HOME/.local/state

	set -Ux EDITOR nvim
	set -Ux TERMINAL ghostty

	set --global fish_key_bindings fish_vi_key_bindings

	# custom functions (alias)

	# fish
	alias f="$EDITOR $XDG_CONFIG_HOME/fish/config.fish"
	alias ff="source $XDG_CONFIG_HOME/fish/config.fish"

	# neovim
	alias v="nvim"
	alias vv="$EDITOR $XDG_CONFIG_HOME/nvim/init.lua"

	# dwm
	alias d="$EDITOR $HOME/dwm/config.h"

  # yazi
  alias r="yazi"
end
