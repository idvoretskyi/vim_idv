## About 

An awesome vim configuration that I use every day.

## Installation

To install it easily, please run:

`curl -sS
https://raw.githubusercontent.com/idvoretskyi/vim_idv/master/install.sh | bash`

The full list of plugins one may find in `'~/.vim/plugins.vim'` file. To add any
new plugin, simply add it to that file.

Example: I'd like to add the NERD tree plugin.
I have to simply run:

`echo "Plugin 'scrooloose/nerdtree' >> ~/.vim/plugins.vim && vim +PluginInstall +qall`.

Detailed information about Plugin installation (using Vundle tool) one may find here -
https://github.com/VundleVim/Vundle.vim
