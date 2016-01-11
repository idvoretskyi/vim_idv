#!/bin/bash

# Cloning the repo
git clone https://github.com/idvoretskyi/idv_vim.git ~/vimrc

# Installing awesome VIM distribution
cd ~/vimrc
cat .vimrc > ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cat .vim/plugins.vim > ~/.vim/plugins.vim
cat .vim/keybindings.vim > ~/.vim/keybindings.vim
vim +PluginInstall +qall

echo "Vim configuration installed successfully!"
