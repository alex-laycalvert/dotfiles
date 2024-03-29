set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT "1"
# set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -Ux EDITOR "/usr/bin/nvim"
set -Ux TERM "kitty"

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# opam configuration
source /home/alex/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
eval (opam env)

# Add ~/.local/bin to PATH
if test -d ~/go/bin
	if not contains -- ~/go/bin $PATH
		set -p PATH ~/go/bin
	end
end

# Add ~/.local/bin to PATH
if test -d /snap/bin
	if not contains -- /snap/bin $PATH
		set -p PATH /snap/bin
	end
end

# Add ~/.local/bin to PATH
if test -d ~/.bun/bin
	if not contains -- ~/.bun/bin $PATH
		set -p PATH ~/.bun/bin
	end
end

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

# Add homebrew to PATH
if test -d /home/linuxbrew/.linuxbrew/bin
	if not contains -- /home/linuxbrew/.linuxbrew/bin $PATH
		set -p PATH /home/linuxbrew/.linuxbrew/bin
	end
end

## Starship Prompt
if status is-interactive
	source (/usr/bin/starship init fish --print-full-init | psub)
end

# ~/.config/fish/functions/nvm.fish
function nvm
	bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
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

# Fish command history
function history
	builtin history --show-time='%F %T '
end

function clip
    cat "$argv" | xclip -selection clipboard
end

alias ls='exa -al --color=always --group-directories-first --icons'
alias la='exa  -a --color=always --group-directories-first --icons'
alias ll='exa  -l --color=always --group-directories-first --icons'
alias lt='exa -aT --color=always --group-directories-first --icons'
alias l.="exa -a | egrep '^\.'"
alias ip='ip -color'
alias cat='bat'
alias yay='yay --color=always'
alias dotgit='git --work-tree=$HOME --git-dir=$HOME/git/dotfiles'
alias lazydot='lazygit -w $HOME -g $HOME/git/dotfiles'
alias nmcli='nmcli -c yes'
alias grubup="sudo update-grub"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias wget='wget -c '
alias rmpkg="sudo pacman -Rdd"
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias upd='/usr/bin/update'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hw='hwinfo --short'                                   # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"              # Sort installed packages according to size in MB
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'			# List amount of -git packages


# Get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Cleanup orphaned packages
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Recent installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

# typos
alias clera="clear"
alias claer="clear"
alias ckear="clear"
alias celas="clear"
alias celar="clear"

alias sdou="sudo"
alias sodu="sudo"

alias ssh="kitty +kitten ssh"

alias test-mic="arecord -vvv -f dat /dev/null"

thefuck --alias | source

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/alex/google-cloud-sdk/path.fish.inc' ]; . '/home/alex/google-cloud-sdk/path.fish.inc'; end
