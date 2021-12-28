set bell-style visible
# 
# alex-laycalvert
#
# .zshrc
#

export EDITOR=nvim

export CHANGE_THEME_SCRIPT_DIR="$HOME/git/mythemes"
export STARSHIP_THEME_DIR="$HOME/.config"
export KITTY_THEME_DIR="$HOME/.config/kitty"
export QTILE_THEME_DIR="$HOME/.config/qtile"
export NVIM_THEME_DIR="$HOME/.config/nvim"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/alex/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# turn off that horrible beep
unsetopt BEEP

# Starship
source <(/usr/bin/starship init zsh --print-full-init)
#source ~/.zsh_prompt

# Mapping Caps to Esc so I don't develop carpal tunnel
setxkbmap -option caps:escape

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	startx
fi


###########
# PLUGINS #
###########

# Change ZSH_PLUGINS and ZSH_PLUGINS_SH to your preffered filenames/path
# ZSH_PLUGINS is the text file containing your plugins to use with antibody
# Append any plugins there
#
# ZSH_PLUGINS is a file created by antibody to bundle plugins

export ZSH_PLUGINS_LIST=$HOME/.zsh_plugins_list
export ZSH_PLUGINS=$HOME/.zsh_plugins
antibody bundle < $ZSH_PLUGINS_LIST > $ZSH_PLUGINS
source $ZSH_PLUGINS

###################
# ADD TO PATH VAR #
###################
pathmunge () {
        if ! echo "$PATH" | /bin/grep -Eq "(^|:)$1($|:)" ; then
           if [ "$2" = "after" ] ; then
              PATH="$PATH:$1"
           else
              PATH="$1:$PATH"
           fi
        fi
}
pathmunge "$HOME/.local/bin"
pathmunge "$HOME/.cargo/bin"
pathmunge "$HOME/git/fun-scripts/christmas/"
pathmunge "$HOME/git/fun-scripts/new-years/"

#colorscript random

###########
# ALIASES #
###########
alias dotgit="/usr/bin/git --git-dir=$HOME/git/dotfiles --work-tree=$HOME"
alias ls="exa -l --icons"
alias la="exa -la --icons"

# Literally just taken from the Garuda Linux fish config file
## Useful aliases
# Replace ls with exa
alias ls='exa -al --color=always --group-directories-first --icons' # preferred listing
alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons'  # long format
alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
alias l.="exa -a | egrep '^\.'"                                     # show only dotfiles

# Replace some more things with better alternatives
alias cat='bat --style header --style rules --style snip --style changes --style header'
#[ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'
alias paru='paru --color=always'
alias yay='yay --color=always'
alias ip="ip -color"

# typos
alias clera="clear"
alias sduo="sudo"
alias pacmna="pacman"
alias sodu="sudo"
alias pamcan="pacman"
alias lua="lua5.2"
alias mkcd="mkdir $1 && cd $1"
alias celra="clear"
alias celar="clear"
alias cjear="clear"
alias ckear="clear"

eval $(thefuck --alias)

colorscript -r
bindkey ";3D" backward-word
bindkey ";3C" forward-word
