#!/bin/bash

set +x

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cd ~/vim
ln -s vimrc.vim ~/.vimrc

echo "Vim configuration installed successfully!"
