#!/bin/bash

ho_english() {
  if [ "$#" = "0" ]; then
    export LC_ALL=en_US.UTF-8
  else
    LC_ALL=en_US.UTF-8 eval "${@}"
  fi
}

ho_swap_reset() {
  sudo swapoff -a && sudo swapon -a
}

ho_notify() {
  # Usage:
  # $ ninja -C build; ho_notify "'ninja build' finished with status ${?}"
  notify-send -a 'ho_notify' "${*:-ho_notify}"
}

ho_whose() {
  # Usage:
  # $ ho_whose yay
  # /usr/bin/yay is owned by yay-bin 11.0.2-1
  result="$(type -P "$1")" && pacman -Qo "$result"
}

ho_ytdl_audio() {
  local dst_dir="$HOME/Music/__tmp__"
  local options=(
    --extract-audio
    --add-metadata
    --output "${dst_dir}/%(channel)s/%(title)s --- %(id)s.%(ext)s"
  )
  for url in "$@"; do
    youtube-dl "${options[@]}" "$url"
  done
}

ho_npm_completion() {
  # shellcheck disable=SC1090
  source <(npm completion)
}

# simple pnpm command completion for package.json scripts
ho_setup_pnpm_completion() {
  _ho_pnpm_completion() {
    # TODO: handle change directory: pnpm -C <directory> <command>
    if ! [ -f package.json ]; then
      return
    fi

    # workaround bash's default word breaks for colon ":"
    #   https://github.com/pnpm/tabtab/blob/ab9ea7029e19aae955952ddc10d403d70cbbbcb7/lib/scripts/bash.sh
    #   https://stackoverflow.com/questions/10528695/how-to-reset-comp-wordbreaks-without-affecting-other-completion-script
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -n : -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    if [ "$cword" != "1" ]; then
      return
    fi

    # shellcheck disable=SC2207
    COMPREPLY=($(jq -r --arg prefix "${words[cword]}" '.scripts | keys | .[] | select(startswith($prefix))' package.json))

    if type __ltrim_colon_completions &>/dev/null; then
      __ltrim_colon_completions "${words[cword]}"
    fi
  }

  complete -o default -F _ho_pnpm_completion pnpm
}
