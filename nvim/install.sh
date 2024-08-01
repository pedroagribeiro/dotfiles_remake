#!/usr/bin/env bash

BASE_DIR=$(dirname "${BASH_SOURCE[0]:-$0}")
cd "${BASE_DIR}/.." || exit 127

# shellcheck source=../scripts/extras.sh
. scripts/extras.sh
# shellcheck source=../scripts/utils.sh
. scripts/utils.sh

# install_package neovim

function install_packer {
	git clone --depth 1 https://github.com/wbthomason/packer.nvim\
	~/.local/share/nvim/site/pack/packer/start/packer.nvim
}

install_packer

symlink "$HOME/.dotfiles/nvim" "$HOME/.config/nvim"
