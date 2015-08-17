#!/bin/bash

set +x

cat vim/vimrc.vim > ~/.vimrc

mkdir ~/.vim/

cp -r vim/plugins.vim ~/.vim/plugins.vim

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

echo "Vim configuration installed successfully!"
