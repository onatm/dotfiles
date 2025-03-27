eval (starship init fish)
eval "$(/opt/homebrew/bin/brew shellenv)"

mcfly init fish | source

# Base16 Shell
if status is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end

fish_vi_key_bindings

set -gx EDITOR nvim
set -x GPG_TTY (tty)

set -g fish_user_paths "/opt/homebrew/sbin" $fish_user_paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

set -g fish_user_paths "$HOME/.cargo/bin" $fish_user_paths

set -g fish_user_paths "$GOPATH/bin" $fish_user_paths
set -g fish_user_paths "$GOROOT/bin" $fish_user_paths

set -g fish_user_paths "$HOME/.dotnet/tools" $fish_user_paths

fish_add_path /opt/homebrew/opt/libpq/bin

# kubectl
set -gx FISH_KUBECTL_COMPLETION_COMPLETE_CRDS 0

# mcfly
set -gx MCFLY_KEY_SCHEME vim

# bat
set -x BAT_THEME base16

# aliases
alias v='nvim'
alias ls='eza'
alias k='kubectl'
alias kn='k ns'
alias kall='k allctx'

# docker aliases
alias dcu='docker compose up -d'
alias dcd='docker compose down'

# git aliases
alias gg='git graph'
