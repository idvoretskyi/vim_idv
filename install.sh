#!/bin/bash

VIMDIR="$HOME/.vim_idv"

# Installing awesome VIM distribution
if [ -e $HOME/.vimrc ];then
    rm -rf $HOME/.vimrc
fi

if [ -e $HOME/.vim ];then
    rm -rf $HOME/.vim
fi

if [ -e $VIMDIR ];then
    rm -rf $VIMDIR
fi

# Cloning the repo
git clone https://github.com/idvoretskyi/vim_idv.git $VIMDIR

ln -s $VIMDIR/vimrc $HOME/.vimrc && ln -s $VIMDIR/functions $HOME/.vim

cd $HOME/.vim
git clone https://github.com/VundleVim/Vundle.vim.git bundle/Vundle.vim
git clone git://github.com/altercation/vim-colors-solarized.git bundle/vim-colors-solarized
vim +PluginInstall +qall

clear && echo "VIM configuration installed successfully!"
