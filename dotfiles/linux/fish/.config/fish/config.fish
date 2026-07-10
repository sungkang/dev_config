if status is-login; and status is-interactive
    if test "$XDG_VTNR" = "1" # tty1
        if test -z "$DISPLAY"; and test -z "$WAYLAND_DISPLAY"
            if not set -q NIRI_STARTED
                set -gx NIRI_STARTED 1
                exec niri-session
            end
            # exec start-hyprland
        end
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
  set -Ux MOZ_ENABLE_WAYLAND 1
  set -Ux XCURSOR_THEME "Bibata-Modern-Ice"
  set -Ux XCURSOR_SIZE 24

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
  fish_add_path $HOME/.config/emacs/bin

	## custom functions (alias) ##

	# fish
	alias f="$EDITOR $XDG_CONFIG_HOME/fish/config.fish"
	alias ff="source $XDG_CONFIG_HOME/fish/config.fish"

  # hyprland config(s)
  alias h="$EDITOR $XDG_CONFIG_HOME/hypr/hyprland.conf"

  # niri config(s)
  alias n="$EDITOR $XDG_CONFIG_HOME/niri/config.kdl"

	# neovim
	alias v="nvim"
	alias vv="$EDITOR $XDG_CONFIG_HOME/nvim/init.lua"

  # .xinitrc (X11)
  # alias x="$EDITOR $HOME/.xinitrc"

	# dwm
	# alias d="$EDITOR $HOME/src/suckless/dwm/config.def.h"

  # yazi
  abbr -a r 'yazi'

  # lazygit
  abbr -a lg 'lazygit'

  # claude code
  abbr -a c 'env -u DISPLAY claude'

  # youtube-dl
  abbr -a yt 'yt-dlp'

  # ghostty settings
  abbr -a ghost "$EDITOR $XDG_CONFIG_HOME/ghostty/config"

  # herdr settings
  abbr -a hr "$EDITOR $XDG_CONFIG_HOME/herdr/config.toml"

  # waybar config
  # abbr -a ww '$EDITOR $XDG_CONFIG_HOME/waybar/config'
  # abbr -a wr 'pkill waybar &>/dev/null; and waybar &>/dev/null &'

  # jump to dev_config
  abbr -a dconf 'cd $HOME/dev/dev_config'

  # jump to .local
  abbr -a conf 'cd $HOME/.config'

  # jump to .local
  abbr -a loc 'cd $HOME/.local'

  # starship init
  starship init fish | source

  # nvm
  set --universal nvm_default_version v25.5.0
  nvm use default --silent

end
