#!/bin/bash

set -x

VUNDLE_REPO='https://github.com/gmarik/Vundle.vim.git'
VUNDLE_DESTINATION=~/.vim/bundle/vundle

print $VUNDLE_REPO

git clone $VUNDLE_REPO $VUNDLE_DESTINATION
Plugin 'w0ng/vim-hybrid'
