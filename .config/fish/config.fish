eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
if test -d (brew --prefix)"/share/fish/completions"
    set -p fish_complete_path (brew --prefix)/share/fish/completions
end

if test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end

set -g fish_greeting
set -gx EDITOR nvim
if which zoxide > /dev/null; zoxide init fish | source; end
if which fzf > /dev/null; fzf --fish | source; end
if which direnv > /dev/null; direnv hook fish | source; end


if status is-interactive
    # Commands to run in interactive sessions can go here
end

# WSL
if test -n (uname -r | grep microsoft)
    set -gx BROWSER explorer.exe
    alias xdg-open="explorer.exe"
end
