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
