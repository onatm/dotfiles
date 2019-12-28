# Default aliases
alias ll='ls -aAl'
alias gg='git graph'

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
  . /usr/share/bash-completion/completions/git

  # Set up autocomplete for Git aliases
  __git_complete gd _git_diff
  __git_complete gds _git_diff
  __git_complete gg _git_log
fi
