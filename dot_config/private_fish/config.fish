eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
if test -d (brew --prefix)"/share/fish/completions"
    set -p fish_complete_path (brew --prefix)/share/fish/completions
end

if test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end

set -g fish_greeting
set -gx EDITOR nvim
set -gx ZELLIJ_AUTO_EXIT true
set -gx ZELLIJ_AUTO_ATTACH true


set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

if status is-interactive
    # Commands to run in interactive sessions can go here
    eval (zellij setup --generate-auto-start fish | string collect)
end

if test -n (uname -r | grep microsoft) 
    set -gx BROWSER wsl-open
    alias xdg-open="wsl-open"
end
