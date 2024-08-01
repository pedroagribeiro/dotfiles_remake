#!/usr/bin/env bash

BASE_DIR=$(dirname "${BASH_SOURCE[0]:-$0}")
cd "${BASE_DIR}/.." || exit 127

# shellcheck source=../scripts/extras.sh
. scripts/extras.sh
# shellcheck source=../scripts/utils.sh
. scripts/utils.sh

execute "git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.git-fuzzy" "Clonning git-fuzzy..."

execute "git -C $HOME/.git-fuzzy pull" "Updating git-fuzzy..." 

symlink "$HOME/.dotfiles/git/gitconfig" "$HOME/.gitconfig"
