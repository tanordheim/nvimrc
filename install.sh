#!/bin/sh

set -e
set -x

BASEDIR=$(pwd -P)

# Prepare the required folders
mkdir -p ~/.vim/bundle ~/.vim/tmp/undo ~/.vim/tmp/backup ~/.vim/tmp/swap

# Install Vundle.
rm -rf ~/.vim/bundle/Vundle.vim
git clone git://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Put the init script in place.
mkdir -p ~/.config/nvim
rm -f ~/.config/nvim/init.vim && ln -sf $BASEDIR/init.vim ~/.config/nvim/init.vim

# Install the required plugins with Vundle.
nvim +PluginInstall +qall

# Configure YouCompleteMe
# (cd ~/.vim/bundle/YouCompleteMe && ./install.py --cs-completer --go-completer --clang-completer --js-completer)
