set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT "1"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -Ux EDITOR "/usr/local/bin/nvim"
set -Ux TERM "kitty"

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

# Add ~/scripts to PATH
if test -d ~/scripts
    if not contains -- ~/scripts $PATH
        set -p PATH ~/scripts
    end
end

# Add ~/.cargo/bin to PATH
if test -d ~/.cargo/bin
    if not contains -- ~/.cargo/bin $PATH
        set -p PATH ~/.cargo/bin
    end
end

# Starship Prompt
if status is-interactive
    source ("/usr/local/bin/starship" init fish --print-full-init | psub)
end

## Functions
# Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

alias ls='exa -al --color=always --group-directories-first --icons'
alias la='exa  -a --color=always --group-directories-first --icons'
alias ll='exa  -l --color=always --group-directories-first --icons'
alias lt='exa -aT --color=always --group-directories-first --icons'
alias l.="exa -a | egrep '^\.'"
alias cat='bat --style header --style snip --style changes --style header'
alias dotgit='git --work-tree=$HOME --git-dir=$HOME/git/dotfiles'
alias lazydot='lazygit -w $HOME -g $HOME/git/dotfiles'
alias wget='wget -c '
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias grep='grep --color=auto'

# typos
alias clera="clear"
alias claer="clear"
alias ckear="clear"
alias celas="clear"
alias celar="clear"

alias sdou="sudo"
alias sodu="sudo"

alias ssh="kitty +kitten ssh"

thefuck --alias | source
