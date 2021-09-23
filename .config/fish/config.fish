eval (starship init fish)

fish_vi_key_bindings

# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end

set -gx EDITOR nvim
set -x GPG_TTY (tty)

# bat
set -x BAT_THEME base16

set -x GOROOT /usr/local/opt/go/libexec
set -x GOPATH $HOME/dev/go
set -x GO111MODULE on

set PATH $HOME/.cargo/bin $PATH
set PATH $HOME/.linkerd2/bin $PATH
set PATH $GOPATH/bin $PATH
set PATH $GOROOT/bin $PATH
set PATH $HOME/.dapr $PATH

# kubectl
set -gx PATH $PATH $HOME/.krew/bin
set -gx FISH_KUBECTL_COMPLETION_COMPLETE_CRDS 0

# rbenv
status --is-interactive; and source (rbenv init -|psub)

# macOS specific
set PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH
set PATH /usr/local/opt/grep/libexec/gnubin $PATH
set PATH /usr/local/opt/make/libexec/gnubin $PATH
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/mysql-client/bin" $fish_user_paths

# aliases
alias v='nvim'
alias ls='exa'
alias k='kubectl'
alias kn='k ns'
alias kall='k allctx'

# git aliases
alias gg='git graph'
