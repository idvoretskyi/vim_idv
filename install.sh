#!/bin/bash

VIMDIR="$HOME/vim_idv"

# Cloning the repo
git clone https://github.com/idvoretskyi/vim_idv.git $VIMDIR

# Installing awesome VIM distribution
if [ -e $HOME/.vim ];then
    rm -rf $HOME/.vim*
fi

ln -s $VIMDIR/vimrc $HOME/.vimrc && ln -s $VIMDIR/functions $HOME/.vim

cd $HOME/.vim
git clone https://github.com/VundleVim/Vundle.vim.git bundle/Vundle.vim
vim +PluginInstall +qall

clear && echo "VIM configuration installed successfully!"
