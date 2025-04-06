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

set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"


if status is-interactive
    # Commands to run in interactive sessions can go here
    set ZELLIJ_AUTO_ATTACH false
    set ZELLIJ_AUTO_EXIT true
    if not set -q ZELLIJ
        if test "$ZELLIJ_AUTO_ATTACH" = "true"
            zellij attach -c main
        else
            zellij
        end

        if test "$ZELLIJ_AUTO_EXIT" = "true"
            kill $fish_pid
        end
    end

end

# WSL
if test -n (uname -r | grep microsoft)
    set -gx BROWSER explorer.exe
    alias xdg-open="explorer.exe"
end
