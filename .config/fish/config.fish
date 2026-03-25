set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT "1"
set -Ux EDITOR "/usr/bin/nvim"
set -Ux TERM "ghostty"

function nvm
	bass source ~/.nvm/nvm.sh --no-use ";" nvm $argv
end

# nvm use default > /dev/null

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
	if not contains -- ~/.local/bin $PATH
		set -p PATH ~/.local/bin
	end
end

# Add ~/go/bin to PATH
if test -d ~/go/bin
	if not contains -- ~/go/bin $PATH
		set -p PATH ~/go/bin
	end
end

# Add ~/.local/bin to PATH
if test -d ~/.pub-cache/bin
	if not contains -- ~/.pub-cache/bin $PATH
		set -p PATH ~/.pub-cache/bin
	end
end

# Add ~/.local/flutter/bin to PATH
if test -d ~/.local/flutter/bin
	if not contains -- ~/.local/flutter/bin $PATH
		set -p PATH ~/.local/flutter/bin
	end
end

if test -d /opt/google-cloud-cli/bin
	if not contains -- /opt/google-cloud-cli/bin $PATH
		set -p PATH /opt/google-cloud-cli/bin
	end
end

if test -d /opt/CrowdStrike
	if not contains -- /opt/CrowdStrike $PATH
		set -p PATH /opt/CrowdStrike
	end
end

if test -d ~/Apps
	if not contains -- ~/Apps $PATH
		set -p PATH ~/Apps
	end
end

alias ls="eza -la --color=always --group-directories-first --icons"
alias grep="grep --color=always"
alias cat="bat"
alias ip="ip -color"
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"
alias test-mic="arecord -vvv -f dat /dev/null"

# opam configuration
source /home/alex/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

abbr paci "sudo pacman -S"
abbr pacs "pacman -Ss"
abbr pacu "sudo pacman -Syu"
abbr parui "paru -S"
abbr parus "paru -Ss"
abbr paruu "paru -Syu"

abbr yws "yarn workspace server"
abbr ywsa "yarn workspace server all-checks"
abbr ywsd "yarn workspace server dev"
abbr ywc "yarn workspace client"
abbr ywca "yarn workspace client all-checks"
abbr ywcd "yarn workspace client dev"
abbr ywe "yarn workspace ep-common"
abbr ywea "yarn workspace ep-common all-checks"
abbr ywt "yarn workspace tests"
abbr ta "tmux attach"

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

set --export ANDROID_HOME "$HOME/Android/Sdk"

alias claude="/home/alex/.claude/local/claude"
alias dotgit="/usr/bin/git --git-dir=$HOME/git/dotfiles --work-tree=$HOME"
alias lazydot="lazygit --git-dir=$HOME/git/dotfiles --work-tree=$HOME"

# opencode
fish_add_path /home/alex/.opencode/bin
