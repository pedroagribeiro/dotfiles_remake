#!/usr/bin/env bash

BASE_DIR=$(dirname "${BASH_SOURCE[0]:-$0}")
cd "${BASE_DIR}/.." || exit 127

# shellcheck source=../scripts/extras.sh
. scripts/extras.sh
# shellcheck source=../scripts/utils.sh
. scripts/utils.sh

ask_for_sudo

install_package i3
install_package j4-dmenu-desktop

symlink "$HOME/.dotfiles/i3/config" "$HOME/.config/i3/config"
