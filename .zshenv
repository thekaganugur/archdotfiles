# Adds `~/.scripts` and all subdirectories to $PATH
export PATH="$(du $HOME/.scripts/ | cut -f2 | tr '\n' ':')$PATH"

export TERMINAL="st"
export EDITOR="nvim"
export READER="zathura"
export FILE="ranger"
export VIEWER="sxiv"
export BROWSER="firefox"
export SEARCHENGINE="google"
# export SUDO_ASKPASS="$HOME/.scripts/tools/dmenupass"
# export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'


 alias e="$EDITOR"
 alias v="nvim"
 alias sv="sudo nvim"
 alias r="ranger"
 alias sr="sudo ranger"
 alias vf="vifm"
 alias svf="sudo vifm"
 alias ka="killall"
 alias p="sudo pacman"
 alias pkglist="pacman -Qqe > .pkglist.txt"
 alias update="yay -Syu && flatpak update"

 alias via="pushd ~/Codes/via-frontend && v -S"
 alias svia="pushd ~/Codes/via-frontend && v -S vimSessionStart"


# Adding color
#  alias ls='ls -hN --color=auto --group-directories-first'
#  alias grep="grep --color=auto"
#  alias diff="diff --color=auto"
