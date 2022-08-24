#!/usr/local/bin/fish
set current_branch "main"

if test (git branch --show-current)
  set current_branch (git branch --show-current)""
end

set first_arg $argv[1]

if test $first_arg = "list"
  git diff --name-only --diff-filter=ACMR --relative $current_branch
end

if test $first_arg = "diff"
  git diff --diff-filter=ACMR --relative $current_branch $argv[2]
end
