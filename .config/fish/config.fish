if status is-interactive
    set -xg XDG_CONFIG_HOME $HOME/.config
    set -xg XDG_DATA_HOME $HOME/.local/share
    set -xg XDG_STATE_HOME $HOME/.local/state

    # setup custom PATHs
    fish_add_path /opt/homebrew/bin
    fish_add_path /opt/homebrew/sbin
    fish_add_path $HOME/.local/bin

    # vi mode
    fish_vi_key_bindings

    # source autojump for fish
    set --local AUTOJUMP_PATH /opt/homebrew/share/autojump/autojump.fish
    if test -e $AUTOJUMP_PATH
        source $AUTOJUMP_PATH
    end

    # configurations
    alias f='nvim $XDG_CONFIG_HOME/fish/config.fish'
    alias ff='source $XDG_CONFIG_HOME/fish/config.fish'
    alias a='nvim $XDG_CONFIG_HOME/alacritty/alacritty.yml'
    alias t='nvim $HOME/.tmux.conf'
    alias tl='nvim $HOME/.tmux.conf.local'
    alias tkk='tmux kill-server'
    alias s='nvim $XDG_CONFIG_HOME/starship.toml'

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
    alias gco='git checkout'
    alias gcm='git checkout (__git.default_branch)'

    alias gd='git diff'
    alias gdca='git diff --cached'
    alias gdcw='git diff --cached --word-diff'
    alias gds='git diff --staged'
    alias gdt='git diff-tree --no-commit-id --name-only -r'
    alias gdw='git diff --word-diff'
    alias gfa='git fetch --all'
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

    # exa
        # general use
        alias ls='exa'                                               # ls
        alias l='exa -lbF --git'                                     # list, size, type, git
        alias lt='exa -lbF --git --tree --level=2'                   # all list
        alias ll='exa -lbGF --git'                                   # long list
        alias la='exa -lbhgma --git --color-scale'                   # all list
        alias lat='exa -lbhgma --git --color-scale --tree --level=2' # all list
        alias lx='exa -lbhgma@ --git --color-scale'                  # all + extended list
        alias lS='exa -1'                                            # one column, just names


    # lazygit
    alias lg="lazygit"
    alias gb="echo (git branch --show-current)"

    # autojump
    #alias j="autojump"

    # starship
    starship init fish | source

    # nvm
    bass source $HOME/.nvm/nvm.sh

end
