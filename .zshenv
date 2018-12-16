# Adds `~/.scripts` and all subdirectories to $PATH
export PATH="$(du $HOME/.scripts/ | cut -f2 | tr '\n' ':')$PATH"
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="google-chrome-stable"
export READER="zathura"



