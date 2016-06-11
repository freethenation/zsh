#!/bin/bash
set -e
chsh -s $(which zsh)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ln -s $DIR/.zshrc $HOME/.zshrc
