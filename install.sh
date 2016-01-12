#!/bin/bash

VIMDIR="~/vim_idv"

# Cloning the repo
git clone https://github.com/idvoretskyi/vim_idv.git $VIMDIR 

# Installing awesome VIM distribution
ln -s $VIMDIR/vimrc ~/.vimrc
ln -s $VIMDIR/vim ~/.vim

cd $VIMDIR/vim
git clone https://github.com/VundleVim/Vundle.vim.git bundle/Vundle.vim
vim +PluginInstall +qall

echo "Vim configuration installed successfully!"
