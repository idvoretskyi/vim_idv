#!/bin/bash

cat .vimrc > ~/.vimrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
 
cp -r .vim/plugins.vim ~/.vim/plugins.vim
cp -r .vim/keybindings.vim ~/.vim/keybindings.vim

vim +PluginInstall +qall


echo "Vim configuration installed successfully!"
