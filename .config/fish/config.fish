eval (starship init fish)

# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end

set -gx EDITOR nvim

# set -x GOROOT /usr/local/opt/go/libexec
set -x GOPATH $HOME/dev/go
set -x GO111MODULE on

set PATH $HOME/.cargo/bin $PATH
set PATH $HOME/.linkerd2/bin $PATH
set PATH $GOPATH/bin $PATH
set PATH $GOROOT/bin $PATH
set PATH $HOME/.fzf/bin $PATH
set -gx FISH_KUBECTL_COMPLETION_COMPLETE_CRDS 0

# macOS specific
set PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH
set PATH /usr/local/opt/grep/libexec/gnubin $PATH

# aliases
alias v='nvim'
alias ls='exa'
alias k='kubectl'
alias kx='kubectx'
alias kn='kubens'

# git aliases
alias gg='git graph'
