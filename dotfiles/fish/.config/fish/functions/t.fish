function t --wraps='tmux attach' --description 'alias t=tmux attach -t $argv; or tmux new -s $argv'
  tmux attach -t $argv; or tmux new -s $argv
end
