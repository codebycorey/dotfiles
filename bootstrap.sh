#!/usr/bin/env bash

xcode-select --install
sudo xcodebuild -license accept

if [[ ! -s "$HOME/.brew/bin/brew" ]]; then
    mkdir -p "$HOME/.brew"
    git clone https://github.com/Homebrew/brew --depth 1 "$HOME/.brew"

    eval "$($HOME/.brew/bin/brew shellenv)"
    brew update --force --quiet
    chmod -R go-w "$(brew --prefix)/share/zsh"
fi

brew bundle install

# Setup required folders
mkdir -pv $HOME/personal
mkdir -pv $HOME/work

source ./clean-dots.sh
source ./install-dots.sh

source ${BASH_SOURCE%/*}/scripts/zsh-bootstrap.sh
source ${BASH_SOURCE%/*}/scripts/starship.sh
source ${BASH_SOURCE%/*}/scripts/nvm.sh
source ${BASH_SOURCE%/*}/scripts/zsh-plugins.sh
source ${BASH_SOURCE%/*}/scripts/rust.sh

