#!/bin/bash

# Cloning the repo
git clone https://github.com/idvoretskyi/vim_idv.git ~/vim_idv/

# Installing awesome VIM distribution
ln -s ~/vim_idv/vimrc ~/.vimrc
ln -s ~/vim_idv/vim ~/.vim

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

echo "Vim configuration installed successfully!"
