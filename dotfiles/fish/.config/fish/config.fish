if status is-login
	if test "$XDG_VTNR" = "1"; and test -z "$DISPLAY"; and test -z "$WAYLAND_DISPLAY"
		exec start-hyprland
	end
end

if status is-interactive
	set -xg XDG_CONFIG_HOME $HOME/.config
	set -xg XDG_DATA_HOME $HOME/.local/share
	set -xg XDG_STATE_HOME $HOME/.local/state

	set -Ux EDITOR nvim
	set -Ux VISUAL nvim
	set -Ux TERMINAL ghostty
  set -Ux BROWSER firefox

  # vi mode
	set --global fish_key_bindings fish_vi_key_bindings

  # custom bindings
  bind -M insert \cf "tmux-sessionizer; commandline -f repaint"
  bind -M default \cf "tmux-sessionizer; commandline -f repaint"

  bind -M insert \ch "eval (history | fzf); commandline -f repaint"
  bind -M default \ch "eval (history | fzf); commandline -f repaint"

  # SSH
  set -Ux SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket

  #PATH
  fish_add_path $HOME/.local/bin
  fish_add_path $HOME/go/bin
  fish_add_path /home/sung/.local/share/JetBrains/Toolbox/scripts

	## custom functions (alias) ##

	# fish
	alias f="$EDITOR $XDG_CONFIG_HOME/fish/config.fish"
	alias ff="source $XDG_CONFIG_HOME/fish/config.fish"

  # hyprland config(s)
  alias h="$EDITOR $XDG_CONFIG_HOME/hypr/hyprland.conf"

	# neovim
	alias v="nvim"
	alias vv="$EDITOR $XDG_CONFIG_HOME/nvim/init.lua"

  # .xinitrc (X11)
  # alias x="$EDITOR $HOME/.xinitrc"

	# dwm
	# alias d="$EDITOR $HOME/src/suckless/dwm/config.def.h"

  # yazi
  alias r="yazi"

  # lazygit
  alias lg="lazygit"

  # claude code
  alias c="claude"

  alias yt="yt-dlp"

  ## custom abbreviations ##

  # ghostty settings
  abbr -a ghost 'nvim ~/.config/ghostty/config'

  # waybar config
  abbr -a ww '$EDITOR $XDG_CONFIG_HOME/waybar/config'
  abbr -a wr 'pkill waybar &>/dev/null; and waybar &>/dev/null &'

  # jump to dev_config
  abbr -a dev 'cd $HOME/dev/dev_config'

  # jump to .local
  abbr -a conf 'cd $HOME/.config'

  # jump to .local
  abbr -a loc 'cd $HOME/.local'

  # starship init
  starship init fish | source

  # autojump init
  if test -f /home/sung/.cache/yay/autojump/pkg/autojump/usr/share/autojump/autojump.fish; . /home/sung/.cache/yay/autojump/pkg/autojump/usr/share/autojump/autojump.fish; end

  # nvm
  set --universal nvm_default_version v25.5.0
  nvm use default --silent

end
