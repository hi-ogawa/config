#!/bin/bash

ho_custom_pip_add() {
  local package="$1"
  pip install "$package"
  pip freeze | grep "$package" >>requirements.txt
}

# cf. https://commondatastorage.googleapis.com/chrome-infra-docs/flat/depot_tools/docs/html/depot_tools_tutorial.html
ho_custom_depot_tools() {
  export PATH="$HOME/code/installed/depot_tools:$PATH"
  export PS1="(depot) $PS1"
}

ho_setup_android() {
  export ANDROID_HOME="$HOME/Android/Sdk"
}

ho_custom_defaults() {
  ho_setup_pnpm_completion
  ho_setup_pyenv
  ho_setup_volta
  ho_setup_asdf
}

ho_custom_defaults
