#!/usr/bin/env bash

function log_section() {
  local LABEL="$1"
  local COLOR="$PURPLE"
  printf "[${COLOR}${BOLD}${LABEL}${RESET}]%*s\n" $(($(tput cols) - ${#LABEL} - 2)) | sed -e 's/ /═/g'
}

function symlink() {
  local SRC="$1"
  local DST="$2"

  execute "ln -s ${SRC} ${DST}" "Symlinking $(basename $DST)"
}

function install_package() {
  local PKG="$1"
  
  if [[ $(get_os_name) == 'darwin' ]]
  then
    execute "brew install ${PKG}"
  else
    execute "apt install -y ${PKG}" "Installing ${BOLD}${PKG}${RESET}..."
  fi
}
