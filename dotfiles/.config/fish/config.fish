if status is-interactive
  set -xg XDG_CONFIG_HOME $HOME/.config
  set -xg XDG_DATA_HOME $HOME/.local/share
  set -xg XDG_STATE_HOME $HOME/.local/state

  set -xg DEV_CONFIG_HOME $HOME/dev/me/dev_config
  set -xg TERMINFO_DIRS $HOME/.local/share/terminfo
  
  set -Ux EDITOR nvim
  set -xg GOPATH $HOME/go
  set -xg TMUX_PROGRAM /opt/homebrew/bin/tmux
  set -xg TMUX_CONF $XDG_CONFIG_HOME/tmux/tmux.conf
  set -xg TMUX_CONF_LOCAL $XDG_CONFIG_HOME/tmux/tmux.conf.local

  # setup custom PATHs
  fish_add_path /opt/homebrew/bin
  fish_add_path /opt/homebrew/sbin
  fish_add_path $HOME/.local/bin
  fish_add_path $HOME/go/bin
  fish_add_path $XDG_CONFIG_HOME/emacs/bin
  fish_add_path $HOME/dev/depot_tools


  # vi mode
  fish_vi_key_bindings

  # custom bindings
  bind -M insert \cf "tmux-sessionizer; commandline -f repaint"
  bind -M default \cf "tmux-sessionizer; commandline -f repaint"

  bind -M insert \ch "eval (history | fzf); commandline -f repaint"
  bind -M default \ch "eval (history | fzf); commandline -f repaint"

  # source autojump for fish
  set --local AUTOJUMP_PATH /opt/homebrew/share/autojump/autojump.fish
  if test -e $AUTOJUMP_PATH
      source $AUTOJUMP_PATH
  end

  # configurations
  alias f="nvim $XDG_CONFIG_HOME/fish/config.fish"
  alias ff="source $XDG_CONFIG_HOME/fish/config.fish"
  alias a="nvim $XDG_CONFIG_HOME/aerospace/aerospace.toml"
  # alias t="launch_tmux"
  alias tc="nvim $XDG_CONFIG_HOME/tmux/tmux.conf"
  alias tl="nvim $XDG_CONFIG_HOME/tmux/tmux.conf.local"
  alias s="nvim $XDG_CONFIG_HOME/starship.toml"
  alias d="nvim $DEV_CONFIG_HOME"
  alias jd="cd $DEV_CONFIG_HOME"
  alias r="yazi"
  alias c="claude"
  alias cu="claude update"

  # neovim
  alias v="nvim"
  alias vv="nvim $XDG_CONFIG_HOME/nvim/init.lua"

  # eza
    # general use
    # alias ls="eza"                                               # ls
    # alias l="eza -lbF --git"                                     # list, size, type, git
    # alias lt="eza -lbF --git --tree --level=2"                   # all list
    # alias ll="eza -lbGF --git"                                   # long list
    # alias la="eza -lbhgma --git --color-scale"                   # all list
    # alias lat="eza -lbhgma --git --color-scale --tree --level=2" # all list
    # alias lx="eza -lbhgma@ --git --color-scale"                  # all + extended list
    # alias lS="eza -1"                                            # one column, just names

  # lazygit
  alias lg="lazygit"
  alias gb="echo (git branch --show-current)"

  # youtube dlp
  alias yt="yt-dlp"

  # cursor
  alias cur="cursor"

  # starship
  starship init fish | source

  # nvm
  bass source $HOME/.nvm/nvm.sh
  nvm use default --silent

  # # >>> conda initialize >>>
  # # !! Contents within this block are managed by "conda init" !!
  # eval /opt/homebrew/anaconda3/bin/conda "shell.fish" "hook" $argv | source
  # # <<< conda initialize <<<

  # pyenv
  # set -Ux PYENV_ROOT $HOME/.pyenv
  # set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
  # pyenv init - | source

  # if command -q tmux; and test -z "$TMUX"
  #   tmux attach -t default; or tmux new -s default
  # end

  # rbenv
  source (rbenv init -|psub)
end

# The next line updates PATH for the Google Cloud SDK.
# if [ -f "/Users/skang/google-cloud-sdk/path.fish.inc" ]; . "/Users/skang/google-cloud-sdk/path.fish.inc"; end
