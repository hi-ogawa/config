#!/bin/bash

# cf. https://commondatastorage.googleapis.com/chrome-infra-docs/flat/depot_tools/docs/html/depot_tools_tutorial.html
ho_custom_depot_tools() {
  export PATH="$HOME/code/installed/depot_tools:$PATH"
}

ho_custom_default() {
  ho_setup_pyenv
  ho_npm_completion
}

ho_custom_default
