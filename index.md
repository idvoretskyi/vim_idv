## About 

An awesome vim configuration. My awesome.

## Screenshot

You may see VIM with opened NERDTree tab, ConqueTerm with Bash and Airline:
![vim_idv screenshot](http://i.imgur.com/jfib9bQ.png?1)

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

* [tpope/vim-eunuch](https://github.com/tpope/vim-eunuch): helpers
  for UNIX

* [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive): a Git wrapper

* [vim-scripts/conque-term](https://github.com/vim-scripts/Conque-Shell): Run
  interactive commands inside a Vim buffer

* [jistr/vim-nerdtree-tabs](https://github.com/jistr/vim-nerdtree-tabs):
  NERDTree and tabs together in Vim, painlessly

* [scrooloose/syntastic](https://github.com/scrooloose/syntastic): Syntax
  checking hacks for vim

* [majutsushi/tagbar](https://github.com/majutsushi/tagbar): Vim plugin that
  displays tags in a window, ordered by scope

* [scrooloose/nerdcommenter](https://github.com/scrooloose/nerdcommenter): Vim
  plugin for intensely orgasmic commenting

* [bling/vim-airline](https://github.com/bling/vim-airline): lean & mean
  status/tabline for vim that's light as air

* [Xuyuanp/nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin):
  A plugin of NERDTree showing git status

* [rodjek/vim-puppet](https://github.com/rodjek/vim-puppet): Puppet niceties
  for your Vim setup

* [vim-ruby/vim-ruby](https://github.com/vim-ruby/vim-ruby): Vim/Ruby
  Configuration Files

* [fatih/vim-go](https://github.com/fatih/vim-go): Go development plugin for
  Vim

* [vim-jp/vim-go-extra](https://github.com/vim-jp/vim-go-extra): Extra plugin
  for golang

* [rjohnsondev/vim-compiler-go](https://github.com/rjohnsondev/vim-compiler-go):
  Vim compiler plugin for Go (golang)

# Bundled colorschemes

* [w0ng/vim-hybrid](https://github.com/w0ng/vim-hybrid): A dark color scheme
  for Vim & gVim (default)

* [toupeira/vim-desertink](https://github.com/toupeira/vim-desertink): A Vim
  colorscheme based on desert.

* [tomasr/molokai](https://github.com/tomasr/molokai): Molokai color scheme for
  Vim

* [sickill/vim-monokai](https://github.com/sickill/vim-monokai): Monokai color
  scheme for Vim 

* [altercation/vim-colors-solarized](https://github.com/altercation/vim-colors-solarized):
  precision colorscheme for the vim text editor

