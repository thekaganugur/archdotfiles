# Adds `~/.scripts` and all subdirectories to $PATH
export PATH="$(du $HOME/.scripts/ | cut -f2 | tr '\n' ':')$PATH"
export EDITOR="nvim"
# export TERMINAL="st"
export TERMINAL="alacritty"
export BROWSER="google-chrome-stable"
export READER="zathura"
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
