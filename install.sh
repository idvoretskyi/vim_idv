#!/bin/bash

# Cloning the repo
git clone https://github.com/idvoretskyi/vim_idv.git ~/vimrc

# Installing awesome VIM distribution
ln -s ~/vimrc/.vimrc ~/.vimrc
ln -s ~/vimrc/.vim ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

echo "Vim configuration installed successfully!"
