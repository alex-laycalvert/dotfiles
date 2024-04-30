set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT "1"
set -Ux EDITOR "/usr/bin/nvim"
set -Ux TERM "kitty"

function nvm
	bass source ~/.nvm/nvm.sh --no-use ";" nvm $argv
end

function set-keymaps
    setxkbmap -option ctrl:nocaps
    xcape -e "Control_L=Escape"
end

# nvm use default > /dev/null

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
	if not contains -- ~/.local/bin $PATH
		set -p PATH ~/.local/bin
	end
end

if status is-interactive
    set-keymaps
	source (/usr/bin/starship init fish --print-full-init | psub)
end

alias ls="eza -la --color=always --group-directories-first --icons"
alias grep="grep --color=always"
alias yay="yay --color=always"
alias cat="bat"
alias ip="ip -color"
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"
alias test-mic="arecord -vvv -f dat /dev/null"

# opam configuration
source /home/alex/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
