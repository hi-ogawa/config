#!/bin/bash

export EDITOR="nano"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# https://man.archlinux.org/man/bash.1.en#PROMPTING
# https://github.com/microsoft/vscode/issues/145016
ho_prompt_command() {
  local status="$?"
  local message_status=""
  if [[ "$status" != "0" ]]; then
    message_status="($status) "
  fi
  local message_cwd="${PWD/#$HOME/\~}"

  # https://stackoverflow.com/a/5947802
  local color_cwd="\033[0;32m"    # green
  local color_status="\033[0;31m" # red
  local color_restore="\033[0m"

  export PS1="$color_cwd$message_cwd $color_status$message_status$color_restore$ "
}

# disable on vscode since it still shows "eval" error on some machine https://github.com/microsoft/vscode/issues/145016
if [[ "$VSCODE_SHELL_INTEGRATION" != "1" ]]; then
  export PROMPT_COMMAND=(ho_prompt_command)
else
  export PROMPT_COMMAND=()
fi
