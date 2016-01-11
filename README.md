## About 

An awesome vim configuration that is used by me in everyday life.

## Installation

To install it easily, please run:

`git clone https://github.com/idvoretskyi/idv_vim.git ~/vimrc && bash
~/vimrc/install.sh && vim +PluginInstall +qall`

_Please, ignore errors if you'll notice any and simply press Enter_

The full list of plugins one may find in `'~/.vim/plugins.vim'` file. To add any
new plugin, simply add it to that file.

Example: I'd like to add the NERD tree plugin.
I have to simply run:

`echo "Plugin 'scrooloose/nerdtree' >> ~/.vim/plugins.vim && vim +PluginInstall +qall` for that.

Detailed information about Plugin installation (using Vundle tool) one may find here -
https://github.com/VundleVim/Vundle.vim
