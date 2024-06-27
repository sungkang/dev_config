if status is-interactive
  set -xg XDG_CONFIG_HOME $HOME/.config
  set -xg XDG_DATA_HOME $HOME/.local/share
  set -xg XDG_STATE_HOME $HOME/.local/state

  set -xg DEV_CONFIG_HOME $HOME/dev/me/dev_config
  set -xg TERMINFO_DIRS $HOME/.local/share/terminfo
  
  set -Ux EDITOR nvim

  # setup custom PATHs
  fish_add_path /opt/homebrew/bin
  fish_add_path /opt/homebrew/sbin
  fish_add_path "$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
  fish_add_path $HOME/.local/bin
  fish_add_path $HOME/go/bin
  fish_add_path $XDG_CONFIG_HOME/emacs/bin


  # vi mode
  fish_vi_key_bindings

  # custom bindings
  bind -M insert \cf 'tmux-sessionizer; commandline -f repaint'
  bind -M default \cf 'tmux-sessionizer; commandline -f repaint'

  # source autojump for fish
  set --local AUTOJUMP_PATH /opt/homebrew/share/autojump/autojump.fish
  if test -e $AUTOJUMP_PATH
      source $AUTOJUMP_PATH
  end

  # configurations
  alias f='nvim $XDG_CONFIG_HOME/fish/config.fish'
  alias ff='source $XDG_CONFIG_HOME/fish/config.fish'
  alias a='nvim $XDG_CONFIG_HOME/alacritty/alacritty.toml'
  alias t='nvim $XDG_CONFIG_HOME/tmux/tmux.conf'
  alias tl='nvim $XDG_CONFIG_HOME/tmux/tmux.conf.local'
  alias s='nvim $XDG_CONFIG_HOME/starship.toml'
  alias d='nvim $DEV_CONFIG_HOME'
  alias r='ranger'

  # neovim
  alias v="nvim $XDG_CONFIG_HOME/nvim/init.lua"

  # git
  alias g='git'

  alias ga='git add'
  alias gaa='git add --all'

  alias gb='git branch'
  alias gba='git branch -a'
  alias gbd='git branch -d'
  alias gbD='git branch -D'

  alias gc='git commit -v'
  alias gc!='git commit -v --amend'
  alias gcn!='git commit -v --no-edit --amend'
  alias gca='git commit -v -a'
  alias gca!='git commit -v -a --amend'
  alias gcan!='git commit -v -a --no-edit --amend'
  alias gcans!='git commit -v -a -s --no-edit --amend'
  alias gcam='git commit -a -m'
  alias gcsm='git commit -s -m'
  alias gcas='git commit -a -s'
  alias gcasm='git commit -a -s -m'
  alias gcb='git checkout -b'
  alias gcf='git config --list'
  alias gcmsg='git commit --message'
  # alias gco='git checkout'
  abbr --add gco git checkout
  alias gcm='git checkout (__git.default_branch)'

  alias gd='git diff'
  alias gdca='git diff --cached'
  alias gdcw='git diff --cached --word-diff'
  alias gds='git diff --staged'
  alias gdt='git diff-tree --no-commit-id --name-only -r'
  alias gdw='git diff --word-diff'
  alias gfa='git fetch --all'
  alias gfap='git fetch --all --prune'
  alias gl='git pull'
  alias glgg='git log --graph'
  alias glgga='git log --graph --decorate --all'
  alias gp='git push'
  alias gpf='git push --force-with-lease'
  alias gpsup='git push --set-upstream origin (__git.current_branch)'
  alias gr='git remote'
  alias gra='git remote add'
  alias grb='git rebase'
  alias grhh='git reset --hard'
  alias gst='git status'
  alias gsta='git stash push'
  alias gstaa='git stash apply'
  alias gstl='git stash list'
  alias gstp='git stash pop'

  # eza
    # general use
    alias ls='eza'                                               # ls
    alias l='eza -lbF --git'                                     # list, size, type, git
    alias lt='eza -lbF --git --tree --level=2'                   # all list
    alias ll='eza -lbGF --git'                                   # long list
    alias la='eza -lbhgma --git --color-scale'                   # all list
    alias lat='eza -lbhgma --git --color-scale --tree --level=2' # all list
    alias lx='eza -lbhgma@ --git --color-scale'                  # all + extended list
    alias lS='eza -1'                                            # one column, just names

  # lazygit
  alias lg="lazygit"
  alias gb="echo (git branch --show-current)"

  # youtube dlp
  alias yt="yt-dlp"

  # starship
  starship init fish | source

  # nvm
  bass source $HOME/.nvm/nvm.sh
  nvm use default --silent

  # # >>> conda initialize >>>
  # # !! Contents within this block are managed by 'conda init' !!
  # eval /opt/homebrew/anaconda3/bin/conda "shell.fish" "hook" $argv | source
  # # <<< conda initialize <<<

  # pyenv
  # set -Ux PYENV_ROOT $HOME/.pyenv
  # set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
  # pyenv init - | source

  if command -q tmux; and test -z "$TMUX"
    tmux attach -t default; or tmux new -s default
  end
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/skang/google-cloud-sdk/path.fish.inc' ]; . '/Users/skang/google-cloud-sdk/path.fish.inc'; end
