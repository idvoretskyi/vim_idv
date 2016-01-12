#!/bin/bash

VIMDIR=~/vim_idv

cd $VIMDIR && git pull --rebase

vim +PluginClean +qall
vim +PluginUpdate +qall

echo "Vim configuration updated successfully!"
