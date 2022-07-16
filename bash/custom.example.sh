#!/bin/bash

# cf. https://commondatastorage.googleapis.com/chrome-infra-docs/flat/depot_tools/docs/html/depot_tools_tutorial.html
ho_custom_depot_tools() {
  export PATH="$HOME/code/installed/depot_tools:$PATH"
  export PS1="(depot) $PS1"
}

# force reset driver when touchpad stucks on dell inspiron laptop
ho_custom_rescue_hid() {
  sudo modprobe -r hid_multitouch
  sudo modprobe hid_multitouch
}

ho_custom_gpg_tty() {
  GPG_TTY=$(tty)
  export GPG_TTY
}

# https://wiki.archlinux.org/title/python#Python_2
ho_python2() {
  python2_bin="$XDG_RUNTIME_DIR/python2_bin"
  mkdir -p "$python2_bin"
  ln -sf /usr/bin/python2 "$python2_bin/python"
  ln -sf /usr/bin/python2-config "$python2_bin/python-config"
  export PATH="$python2_bin:$PATH"
}

ho_custom_default() {
  ho_setup_volta
  ho_custom_gpg_tty
  # ho_setup_pyenv
  # ho_npm_completion
}

ho_custom_default
