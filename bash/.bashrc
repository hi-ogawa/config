#!/bin/bash

ho_bashrc_path=$(readlink -f "${BASH_SOURCE[0]}")
ho_bash_dir=$(dirname "$ho_bashrc_path")

source "$ho_bash_dir/export.sh"
source "$ho_bash_dir/version-manager.sh"
source "$ho_bash_dir/misc.sh"
if [ -f "$ho_bash_dir/custom.sh" ]; then
  source "$ho_bash_dir/custom.sh"
fi
