#!/bin/bash

VIMDIR=~/vim_idv

cd $VIMDIR && git pull

vim +PluginClean +qall
vim +PluginUpdate +qall

#echo "Vim configuration updated successfully!"
