set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT "1"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias ls='exa -al --color=always --group-directories-first --icons'
alias la='exa  -a --color=always --group-directories-first --icons'
alias ll='exa  -l --color=always --group-directories-first --icons'
alias lt='exa -aT --color=always --group-directories-first --icons'
alias l.="exa -a | egrep '^\.'"
alias ip='ip -color'
alias cat='bat --style header --style rules --style snip --style changes --style header'
alias pacman='pacman --color=always'
alias yay='yay --color=always'
alias dotgit='git --work-tree=$HOME --git-dir=$HOME/git/dotfiles'
alias lazydot='lazygit -w $HOME -g $HOME/git/dotfiles'
