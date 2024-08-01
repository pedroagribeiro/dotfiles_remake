#!/usr/bin/env bash

BASE_DIR=$(dirname "${BASH_SOURCE[0]:-$0}")
cd "${BASE_DIR}/.." || exit 127

# shellcheck source=../scripts/extras.sh
. scripts/extras.sh
# shellcheck source=../scripts/utils.sh
. scripts/utils.sh

ask_for_sudo

install_package zsh
install_package direnv

ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}

execute 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"' "Installing Oh-My-ZSH..."

execute "git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions" "Clonning zsh-autosuggestions..."

execute "git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting" "Clonning zsh-syntax-highlighting..." 

symlink "$HOME/.dotfiles/zsh/zshrc" "$HOME/.zshrc"

execute "sudo chsh --shell $(command -v zsh) $USER" "Changing $USER's shell to $(command -v zsh)"
