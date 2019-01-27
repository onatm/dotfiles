# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end

abbr -a vim nvim

# source $HOME/.profile

set -x GOROOT /usr/local/opt/go/libexec
set -x GOPATH $HOME/dev/go
set PATH $HOME/.cargo/bin $PATH
set PATH $GOPATH/bin $PATH
set PATH $GOROOT/bin $PATH
set PATH $HOME/.fzf/bin $PATH

# macOS specific
# set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths

# aliases
# alias tmux='tmux -2'
alias gg='git graph'
