if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end

# fzf
export PATH="$PATH:$HOME/.fzf/bin"

# aliases
# alias tmux='tmux -2'
alias gg='git graph'
