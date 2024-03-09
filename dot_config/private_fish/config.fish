if status is-interactive
    # Commands to run in interactive sessions can go here
end

devbox global shellenv --init-hook | source
starship init fish | source

set -g fish_greeting
set -gx EDITOR nvim
