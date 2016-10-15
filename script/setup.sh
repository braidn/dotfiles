#!/usr/bin/env bash
#
# Dotfiles installer

SRCDIR="$HOME/src"

if [[ ! -d "$SRCDIR" ]]; then
  mkdir "$SRCDIR"
fi

cd "$SRCDIR"

gem install homesick

homesick clone braidn/dotfiles
homesick symlink dotfiles

if [[ ! -d "$HOME/.zprezto" ]]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto"

  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done
fi
