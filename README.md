## About 

An awesome vim configuration. My awesome.

## Screenshot

You may see VIM with opened NERDTree tab, ConqueTerm with Bash and Airline:
![vim_idv screenshot](http://i.imgur.com/jfib9bQ.png?1)

## Installation

To install it easily, please run:

`curl -sS https://raw.githubusercontent.com/idvoretskyi/vim_idv/master/install.sh | bash`


## Plugin Management
The full list of plugins one may find in `'~/.vim/plugins.vim'` file. To add any
new plugin, simply add it to that file.

Example: I'd like to add the NERD tree plugin.
I have to simply run:

`echo "Plugin 'scrooloose/nerdtree' >> ~/.vim/plugins.vim && vim +PluginInstall +qall`.

Detailed information about Plugin installation one may find in [Vundle.vim](https://github.com/VundleVim/Vundle.vim) documentation.

## Bundled plugins

You may find the list of plugins in `functions/plugins.vim`