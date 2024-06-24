#!/bin/bash

# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# fzf-tab
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab

# zoxide
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
# obs.: need to add `eval "$(zoxide init zsh)"` to .zshrc

# fzf
sudo apt install fzf

# ripgrep
sudo apt install ripgrep

# fdfind
sudo apt install fdfind
# create link to point fd to fdfind

# guake
sudo apt install guake
## guake --restore-preferences cfg_name

# Brave Browser
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

# Brave Web Apps
# - Whatsapp Web

# Chrome
# To DO

# Chrome Web Apps
# - Youtube
# - Calendar
# - Gmail

# NeoVim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
# Should check if .local/opt exists
sudo rm -rf ~/.local/opt/nvim
sudo tar -C ~/.local/opt -xzf nvim-linux64.tar.gz # Should name the folder nvim
# Should add the executable to path

# Tmux
sudo apt install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# prefix + I to install tpm plugins
# Install a nerdfont
