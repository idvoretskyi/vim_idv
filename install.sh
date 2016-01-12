#!/bin/bash

VIMDIR="~/vim_idv"

# Cloning the repo
if [ -e "$VIMDIR" ]; then
    rm -rf $VIMDIR
fi

git clone https://github.com/idvoretskyi/vim_idv.git $VIMDIR

# Installing awesome VIM distribution
if [ -e ~/.vim* ];then
    rm -rf ~/.vim*
fi

ln -s $VIMDIR/vimrc ~/.vimrc && ln -s $VIMDIR/vim ~/.vim

cd $VIMDIR/vim
git clone https://github.com/VundleVim/Vundle.vim.git bundle/Vundle.vim
vim +PluginInstall +qall

echo "Vim configuration installed successfully!"
