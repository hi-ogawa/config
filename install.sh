#!/bin/bash
set -o errexit

case "$1" in
-h | --help | '')
  echo ":: Supported arguments"
  grep -P '  \w+\)' install.sh | awk '{ split($1, s, ")"); print s[1] }'
  exit 1
  ;;
esac

for arg in "${@}"; do
  case "$arg" in
  bash)
    ln -sf "${PWD}/bash/.bashrc" "${HOME}/.bashrc"
    ;;

  git)
    ln -sf "${PWD}/git/.gitconfig" "${HOME}/.gitconfig"
    ln -sf "${PWD}/git/.gitignore-global" "${HOME}/.gitignore-global"
    ;;

  vscode)
    ln -sf "${PWD}/vscode/settings.json" "${HOME}/.config/Code - Insiders/User/settings.json"
    ln -sf "${PWD}/vscode/keybindings.json" "${HOME}/.config/Code - Insiders/User/keybindings.json"
    ;;

  tmux)
    ln -sf "$PWD/tmux/.tmux.conf" "${HOME}/.tmux.conf"
    ;;

  mpd)
    ln -sf "$PWD/mpd/mpd.conf" "${HOME}/.config/mpd"
    ;;

  *)
    echo ":: Unknown argument: ${arg}"
    ;;
  esac
done
