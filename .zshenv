# Adds `~/.scripts` and all subdirectories to $PATH
export PATH="$(du $HOME/.scripts/ | cut -f2 | tr '\n' ':')$PATH"

export TERMINAL="st"
export EDITOR="nvim"
export READER="zathura"
export FILE="ranger"
export FILE_X="pcmanfm"
export VIEWER="sxiv"
export BROWSER="firefox"
export SEARCHENGINE="google"
export FZF_DEFAULT_OPTS='--height 40% --border --color 16'
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export MYVIMRC="$HOME/.config/nvim/init.vim"
export NVIM_TUI_ENABLE_TRUE_COLOR='1 nvim'

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
alias evimrc="$EDITOR $MYVIMRC"

# Adding color
alias ls='ls -hN --color=auto --group-directories-first'
alias grep="grep --color=auto"
alias diff="diff --color=auto"
