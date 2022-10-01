#!/bin/bash

# cf. https://commondatastorage.googleapis.com/chrome-infra-docs/flat/depot_tools/docs/html/depot_tools_tutorial.html
ho_custom_depot_tools() {
  export PATH="$HOME/code/installed/depot_tools:$PATH"
  export PS1="(depot) $PS1"
}

ho_android() {
  export ANDROID_HOME="$HOME/Android/Sdk"
}

ho_custom_default() {
  ho_setup_volta
  ho_android
  # ho_setup_pyenv
  # ho_npm_completion
}

ho_custom_default
