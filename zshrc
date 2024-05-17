export PATH="$PATH:$HOME/.local/bin/"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Load oh-my-zsh theme
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
git
zsh-autosuggestions
zsh-syntax-highlighting
command-not-found
fzf
fzf-tab
# z
# zsh-autocomplete
# zsh-vi-mode
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Setup ls colors
source ~/.dircolors/dircolors.default_alt

# Setup Zoxide
eval "$(zoxide init --cmd cd zsh)"

