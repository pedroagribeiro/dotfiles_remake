#!/usr/bin/env bash

import() {
  local -r SCRIPTS_DIR=$(dirname "${BASH_SOURCE[0]:-$0}")

  # shellcheck source=/dev/null
  . "${SCRIPTS_DIR}/${1}"
}

# shellcheck source=./helpers.sh
import helpers.sh

function ask_for_sudo() {
  # Ask for the administrator password upfront
  sudo -v &/dev/null

  # Update existing `sudo` time stamp
  # until this script is finished.
  #
  # https://gist.github.com/cowboy/3118588
  while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
  done &>/dev/null &
}

function get_os_name() {
  uname | tr '[:upper:]' '[:lower:]'
}

[ "$0" = "${BASH_SOURCE[0]}" ] && display_version 0.0.1 || true
