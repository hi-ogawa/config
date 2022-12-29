#!/bin/bash

export EDITOR="nano"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# https://man.archlinux.org/man/bash.1.en#PROMPTING
ho_prompt_command() {
  local status="$?"
  local status_message=""
  if [ "$status" != "0" ]; then
    status_message="($status) "
  fi
  local color_cwd="\[\033[0;32m\]"    # green
  local color_status="\[\033[0;31m\]" # red
  local color_restore="\[\033[0m\]"
  export PS1="$color_cwd\W $color_status$status_message$color_restore$ "
}
export PROMPT_COMMAND=ho_prompt_command
