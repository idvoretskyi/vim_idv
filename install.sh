#!/bin/bash

VIMDIR="$HOME/vim_idv"

# Cloning the repo
if [ -e "$VIMDIR" ]; then
    echo "This VIM configuration has been already installed. Please, run the
    update script for updating it" && exit 0
else
    git clone https://github.com/idvoretskyi/vim_idv.git $VIMDIR
fi

# Installing awesome VIM distribution
if [ -e $HOME/.vim* ];then
    rm -rf $HOME/.vim*
fi

ln -s $VIMDIR/vimrc $HOME/.vimrc && ln -s $VIMDIR/vim $HOME/.vim

cd $VIMDIR/vim
git clone https://github.com/VundleVim/Vundle.vim.git bundle/Vundle.vim
vim +PluginInstall +qall

echo "VIM configuration installed successfully!"
