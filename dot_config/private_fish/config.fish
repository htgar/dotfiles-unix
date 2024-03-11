if status is-interactive
    # Commands to run in interactive sessions can go here
end

eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
if test -d (brew --prefix)"/share/fish/completions"
    set -p fish_complete_path (brew --prefix)/share/fish/completions
end

if test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end

set -g fish_greeting
set -gx EDITOR nvim
