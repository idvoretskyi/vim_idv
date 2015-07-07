#!/bin/bash

set +x

cd ~/.vim
ln -s `pwd`/vimrc.vim ~/.vimrc

echo "Vim configuration installed successfully!"
