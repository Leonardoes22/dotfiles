#!/bin/bash

log_success() {
    echo "[SUCCESS] - $1" | tee -a install.log
}

log_error() {
    echo "[ERROR] - $1" | tee -a install.log
}

log_info() {
    echo "[INFO] - $1" | tee -a install.log
}

check_command() {
    command -v "$1" >/dev/null 2>&1 && log_success "$1 successfully installed" || log_error "$1 failed to install"
}

setup_zsh() {
    log_info "Starting zsh setup..."

    if [ ! -d "$HOME/.oh-my-zsh" ]; then
    log_info "Installing oh-my-zsh setup"
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended || log_error "Failed to install oh-my-zsh"
    else
        log_info "Skipping oh-my-zsh setup. Directory already exists"
    fi

    # zsh-autosuggestions
    if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
        log_info "Installing zsh-autosuggestions"
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions || log_error "Failed to install zsh-autosuggestions"
    else
        log_info "Skipping zsh-autosuggestions setup. Directory already exists"
    fi

    # zsh-syntax-highlighting
    if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
        log_info "Installing zsh-syntax-highlighting"
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting || log_error "Failed to install zsh-syntax-highlighting"
    else
        log_info "Skipping zsh-syntax-highlighting setup. Directory already exists"
    fi

    # fzf-tab
    if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fzf-tab" ]; then
        log_info "Installing fzf-tab"
        git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fzf-tab || log_error "Failed to install fzf-tab"
    else
        log_info "Skipping fzf-tab setup. Directory already exists"
    fi

    # powerlevel10k
    if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fzf-tab" ]; then
        log_info "Installing powerlevel10k"
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k || log_error "Failed to install powerlevel10k"
    else
        log_info "Skipping powerlevel10k setup. Directory already exists"
    fi

    
}

setup_bash() {

    # oh-my-bash
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

    # starship
    curl -sS https://starship.rs/install.sh | sh -s - --bin-dir "$HOME/.local/bin"
    echo 'eval "$(starship init bash)"' >> $HOME/.bashrc
}

setup_terminal_utilities() {

    # zoxide
    curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
    check_command zoxide

    # fzf
    sudo apt-get install -y fzf
    check_command fzf

    # ripgrep
    sudo apt-get install -y ripgrep
    check_command rg

    # fdfind
    sudo apt-get install -y fd-find
    sudo ln -s /usr/bin/fdfind /usr/bin/fd # create link to point fd to fdfind
    check_command fdfind
    check_command fd 

    # tmux
    sudo apt-get install -y tmux
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    # prefix + I to install tpm plugins
    # Install a nerdfont
    check_command tmux

    # lazygit
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit /usr/local/bin
    rm lazygit*
    check_command lazygit

    # neovim
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
    sudo tar -C /opt -xzf nvim-linux64.tar.gz
    rm nvim-linux64.tar.gz
    sudo ln -s /opt/nvim-linux64/bin/nvim /usr/local/bin
    
    
    # pyright installation requires nmp 
    curl -fsSL https://fnm.vercel.app/install | bash
    fnm use --install-if-missing 20

    check_command fnm
    check_command nvim

}

setup_apps() {

    # guake
    sudo apt-get install -y guake
    guake --restore-preferences guake

    check_command guake

    # brave browser
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt update
    sudo apt install brave-browser

}

setup_zsh || log_error "Failed to setup zsh"
# setup_bash || log_error "Failed to setup bash"
setup_terminal_utilities || log_error "Failed to setup terminal utilities"
setup_apps || log_error "Failed to setup applications"