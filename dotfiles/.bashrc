# -----------------------------------------------------
# ~/.bashrc
# -----------------------------------------------------

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '

# Define Editor
export EDITOR=nvim

# -----------------------------------------------------
# ALIASES
# -----------------------------------------------------

alias c='clear'
alias nf='fastfetch'
alias pf='fastfetch'
alias ff='fastfetch'
alias ls='eza -a --icons'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'
alias shutdown='systemctl poweroff'
alias v='$EDITOR'
alias vim='$EDITOR'
alias ts='~/.dotfiles/scripts/snapshot.sh'
alias wifi='nmtui'
alias rw='~/.dotfiles/waybar/reload.sh'
alias winclass="xprop | grep 'CLASS'"
alias dot="cd ~/.dotfiles"
alias cleanup='~/.dotfiles/scripts/cleanup.sh'
if [ -f ~/.bash_history ]; then
    alias chfull='rm ~/.bash_history && history -c'
else
    alias chfull='history -c'
fi
alias relob='source ~/.bashrc'

# -----------------------------------------------------
# GIT
# -----------------------------------------------------

alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gst="git stash"
alias gsp="git stash; git pull"
alias gcheck="git checkout"
alias gcredential="git config credential.helper store"

# -----------------------------------------------------
# EDIT CONFIG FILES
# -----------------------------------------------------

alias confq='$EDITOR ~/.dotfiles/qtile/config.py'
alias confp='$EDITOR ~/.dotfiles/picom/picom.conf'
alias confb='$EDITOR ~/.dotfiles/.bashrc'

# -----------------------------------------------------
# EMACS
# -----------------------------------------------------

export PATH="$HOME/.config/emacs/bin:$PATH"

# -----------------------------------------------------
# DEVELOPMENT
# -----------------------------------------------------
alias dotsync="~/.dotfiles-versions/dotfiles/.dev/sync.sh dotfiles"

# -----------------------------------------------------
# START STARSHIP
# -----------------------------------------------------
eval "$(starship init bash)"

# -----------------------------------------------------
# PYWAL
# -----------------------------------------------------
cat ~/.cache/wal/sequences

# -----------------------------------------------------
# Fastfetch if on wm
# -----------------------------------------------------
if [[ $(tty) == *"pts"* ]]; then
    fastfetch --config examples/13
else
    echo
    if [ -f /bin/qtile ]; then
        echo "Start Qtile X11 with command Qtile"
    fi
    if [ -f /bin/hyprctl ]; then
        echo "Start Hyprland with command Hyprland"
    fi
fi

# Latex
export PATH="$HOME/.texlive/2024/bin/x86_64-linux:$PATH"
alias exlatex='pdflatex main.tex'

# Miniconda
alias phdenv='source ~/.miniconda3/bin/activate && conda activate PhD'