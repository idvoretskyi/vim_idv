#!/bin/bash

VIMDIR="$HOME/.vim_runtime"

# Installing the awesome VIM distribution
if [ -e $HOME/.vimrc ];then
    rm -rf $HOME/.vimrc
fi

if [ -e $HOME/.vim ];then
    rm -rf $HOME/.vim
fi

if [ -e $VIMDIR ];then
    rm -rf $VIMDIR
f

ln -s $VIMDIR/vimrc $HOME/.vimrc && ln -s $VIMDIR/functions $HOME/.vim

cd $HOME/.vim
git clone https://github.com/VundleVim/Vundle.vim.git bundle/Vundle.vim
vim +PluginInstall +qall