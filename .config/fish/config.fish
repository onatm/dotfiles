eval (starship init fish)

# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end

set -gx EDITOR nvim

set -x GOROOT /usr/local/opt/go/libexec
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

set -g fish_user_paths "/usr/local/opt/libpq/bin" $fish_user_paths
set -gx LDFLAGS "-L/usr/local/opt/libpq/lib"
set -gx CPPFLAGS "-I/usr/local/opt/libpq/include"

set -g fish_user_paths "/usr/local/opt/binutils/bin" $fish_user_paths
set -gx LDFLAGS "-L/usr/local/opt/binutils/lib"
set -gx CPPFLAGS "-I/usr/local/opt/binutils/include"

set -g fish_user_paths "/usr/local/opt/gettext/bin" $fish_user_paths
set -gx LDFLAGS "-L/usr/local/opt/gettext/lib"
set -gx CPPFLAGS "-I/usr/local/opt/gettext/include"

set -g fish_user_paths "/usr/local/opt/ncurses/bin" $fish_user_paths
set -gx LDFLAGS "-L/usr/local/opt/ncurses/lib"
set -gx CPPFLAGS "-I/usr/local/opt/ncurses/include"

set -g fish_user_paths "/usr/local/opt/m4/bin" $fish_user_paths
set -gx LDFLAGS "-L/usr/local/opt/m4/lib"
set -gx CPPFLAGS "-I/usr/local/opt/m4/include"

set -g fish_user_paths "/usr/local/opt/openssl@1.1/bin" $fish_user_paths
set -gx LDFLAGS "-L/usr/local/opt/openssl@1.1/lib"
set -gx CPPFLAGS "-I/usr/local/opt/openssl@1.1/include"

set -g fish_user_paths "/usr/local/opt/avr-gcc@8/bin"
set -gx LDFLAGS "-L/usr/local/opt/avr-gcc@8/lib"
set -gx CLDFLAGS "-I/usr/local/opt/avr-gcc@8/include"

# aliases
alias v='nvim'
alias ls='exa'
alias k='kubectl'
alias kx='kubectx'
alias kn='kubens'

# git aliases
alias gg='git graph'
