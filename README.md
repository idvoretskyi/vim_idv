## About 

An awesome vim configuration that I use every day.

## Installation

To install it easily, please run:

`curl -sS https://raw.githubusercontent.com/idvoretskyi/vim_idv/master/install.sh | bash`

## Updating existing installation

Simply run the following command:

`curl -sS https://raw.githubusercontent.com/idvoretskyi/vim_idv/master/update.sh | bash`

## Plugin Management
The full list of plugins one may find in `'~/.vim/plugins.vim'` file. To add any
new plugin, simply add it to that file.

Example: I'd like to add the NERD tree plugin.
I have to simply run:

`echo "Plugin 'scrooloose/nerdtree' >> ~/.vim/plugins.vim && vim +PluginInstall +qall`.

Detailed information about Plugin installation one may find in [Vundle.vim](https://github.com/VundleVim/Vundle.vim) documentation.

# Bundled plugins

In my vim distribution the following Plugins are used:

* [christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator):
  Seamless navigation between tmux panes and vim splits

* [JarrodCTaylor/vim-shell-executor](https://github.com/JarrodCTaylor/vim-shell-executor):
  Execute vim buffer in the shell and view output in split pane

* [andviro/flake8-vim](https://github.com/nvie/vim-flake8): Flake8 plugin for
  Vim

* [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree.git): A tree
  explorer plugin for vim.

* [klen/python-mode](https://github.com/klen/python-mode): Vim python-mode.
  PyLint, Rope, Pydoc, breakpoints from box.

* [davidhalter/jedi-vim](https://github.com/davidhalter/jedi-vim): Using the
  jedi autocompletion library for VIM.

* [vim-scripts/nginx.vim](http://www.vim.org/scripts/script.php?script_id=1886):
  Highlights configuration files for nginx
* [toupeira/vim-desertink](https://github.com/toupeira/vim-desertink): A Vim
  colorscheme based on desert.

* [tomasr/molokai](https://github.com/tomasr/molokai): Molokai color scheme for
  Vim

* [tpope/vim-eunuch](https://github.com/tpope/vim-eunuch): eunuch.vim: helpers
  for UNIX
* [tpope/vim-fugitive]
* [rosenfeld/conque-term]
* [jistr/vim-nerdtree-tabs]
* [scrooloose/syntastic]
* [majutsushi/tagbar]
* [sickill/vim-monokai]
* [w0ng/vim-hybrid]
* [scrooloose/nerdcommenter]
* [bling/vim-airline]
* [Conque-Shell]
* [Xuyuanp/nerdtree-git-plugin]
* [rodjek/vim-puppet]
* [vim-ruby/vim-ruby]
* [godlygeek/tabular]
* [altercation/vim-colors-solarized]
* [fatih/vim-go]
* [vim-jp/vim-go-extra]
* [rjohnsondev/vim-compiler-go]
