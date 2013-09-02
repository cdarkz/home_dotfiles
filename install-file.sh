#!/bin/sh
echo "Install to $HOME"
cp -rf bin .ssh $HOME
cp -f .bashrc .gitconfig .kermrc .vimrc $HOME
