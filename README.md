# IDV's Vim Configuration

A comprehensive and well-organized Vim configuration optimized for Python development, DevOps workflows, and general productivity. This setup includes carefully selected plugins, sensible defaults, and productive key mappings.

## Quick Start

### One-line Installation (Recommended)

Install everything with a single command:
```bash
curl -sL https://raw.githubusercontent.com/idvoretskyi/vim_idv/master/setup.sh | bash
```

### Local Installation

If you've already cloned the repository:
```bash
git clone https://github.com/idvoretskyi/vim_idv.git
cd vim_idv
./install.sh
```

## Requirements

- **Vim 8.0+** or **Neovim 0.4+**
- **Git** (for plugin management and repository cloning)
- **curl** (for downloading components)
- **Python 3** (for Python development features)

Optional but recommended:
- **FZF** for enhanced fuzzy finding
- **ripgrep** for faster text searching
- **Powerline fonts** for better status line appearance

## Features

### Core Functionality
- **Modern Plugin Management**: Powered by vim-plug with auto-installation
- **Python Development**: Complete IDE-like features for Python coding
- **Git Integration**: Built-in git commands and visual diff indicators
- **File Navigation**: Enhanced file explorer and fuzzy finding
- **Code Quality**: Automatic linting and syntax checking
- **AI Assistance**: GitHub Copilot integration for intelligent code completion
- **Performance Optimized**: Fast startup with lazy loading of plugins

### Key Highlights
- Fuzzy Finding: Fast file and content search with FZF
- File Explorer: Enhanced NERDTree with git status integration
- Status Line: Beautiful and informative airline status bar
- Python IDE: Complete Python development environment
- Code Quality: Automatic PEP8 compliance and linting
- Themes: Beautiful Solarized color scheme
- Productivity: Extensive key mappings for common tasks

## Included Plugins

### Core Plugins
| Plugin | Description |
|--------|-------------|
| [vim-sensible](https://github.com/tpope/vim-sensible) | Sensible defaults for Vim |
| [vim-fugitive](https://github.com/tpope/vim-fugitive) | Git integration |
| [syntastic](https://github.com/vim-syntastic/syntastic) | Syntax checking framework |

### Interface & Navigation
| Plugin | Description |
|--------|-------------|
| [vim-airline](https://github.com/vim-airline/vim-airline) | Enhanced status line |
| [nerdtree](https://github.com/preservim/nerdtree) | File system explorer |
| [fzf.vim](https://github.com/junegunn/fzf.vim) | Fuzzy finder integration |
| [tagbar](https://github.com/preservim/tagbar) | Code structure browser |

### Python Development
| Plugin | Description |
|--------|-------------|
| [jedi-vim](https://github.com/davidhalter/jedi-vim) | Python autocompletion |
| [python-mode](https://github.com/python-mode/python-mode) | Python IDE features |
| [vim-flake8](https://github.com/nvie/vim-flake8) | PEP8 style checking |

### Code Quality & Git
| Plugin | Description |
|--------|-------------|
| [vim-gitgutter](https://github.com/airblade/vim-gitgutter) | Git diff indicators |
| [nerdcommenter](https://github.com/preservim/nerdcommenter) | Easy commenting |
| [auto-pairs](https://github.com/jiangmiao/auto-pairs) | Auto-close brackets |
| [copilot.vim](https://github.com/github/copilot.vim) | AI code assistance |

## Key Mappings

### File Navigation
| Key | Action |
|-----|--------|
| `<C-f>` | Toggle file explorer (NERDTree) |
| `<C-t>` | Toggle code structure (Tagbar) |
| `,f` | Fuzzy find files |
| `,b` | Fuzzy find buffers |
| `,g` | Search in files (ripgrep) |

### Window Management
| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Navigate between splits |
| `<C-h/l>` | Switch between tabs |
| `<C-n>` | New tab |

### Git Operations
| Key | Action |
|-----|--------|
| `,gs` | Git status |
| `,gc` | Git commit |
| `,gp` | Git push |
| `]h / [h` | Navigate git hunks |

### Python Development
| Key | Action |
|-----|--------|
| `,r` | Run Python file |
| `,8` | Lint Python file (Flake8) |
| `,d` | Show documentation |

Note: Python plugins load automatically when editing .py files.

### General Editing
| Key | Action |
|-----|--------|
| `,w` | Save file |
| `,q` | Quit |
| `,<Space>` | Clear search highlight |
| `,ev` | Edit vimrc |
| `,sv` | Reload vimrc |

## Python Development Features

This configuration is optimized for Python development with:

- **PEP8 Compliance**: Automatic line length, indentation, and style checking
- **Code Completion**: Intelligent autocompletion with Jedi
- **Linting**: Real-time syntax and style checking with Flake8
- **Code Navigation**: Jump to definitions, find usages
- **Documentation**: Inline documentation display
- **Testing**: Easy test running and debugging

## Customization

### Environment Variables
- `DEBUG=1`: Enable debug mode for installation scripts
- `VERBOSE=1`: Show detailed installation information

### Configuration Files
- `~/.vimrc`: Main Vim configuration
- `~/.vim/`: Vim data directory
  - `plugged/`: Installed plugins
  - `backup/`: Backup files
  - `swap/`: Swap files  
  - `undo/`: Undo history

## Project Structure

```
vim_idv/
├── .vimrc                 # Main Vim configuration
├── install.sh             # Local installation script
├── setup.sh               # Remote installation script
├── lib/
│   └── utils.sh           # Shared utility functions
└── README.md              # This documentation
```

## Troubleshooting

### Performance Notes

This configuration is optimized for fast startup:
- Plugins are lazy-loaded when needed
- NERDTree doesn't auto-open on startup (use `<C-f>` to open)
- Syntax checking runs on demand rather than automatically
- GitHub Copilot loads manually (run `:Copilot setup` when needed)

### Common Issues

**Plugin Installation Fails**
```bash
# Manually install plugins
vim +PlugInstall +qall
```

**Python Features Not Working**
```bash
# Ensure Python 3 is available
python3 --version
# Install Python development tools
pip3 install flake8 jedi
```

**Git Integration Issues**
```bash
# Verify git is installed and configured
git --version
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### Reset Configuration
To start fresh:
```bash
# Backup current configuration
mv ~/.vimrc ~/.vimrc.backup

# Remove plugin directory
rm -rf ~/.vim/plugged

# Reinstall
./install.sh
```

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.

### Development Setup
```bash
# Clone the repository
git clone https://github.com/idvoretskyi/vim_idv.git
cd vim_idv

# Make changes and test
./install.sh

# Submit a pull request
```

## License

This project is open source and available under the MIT License.

## Support

- **Issues**: [GitHub Issues](https://github.com/idvoretskyi/vim_idv/issues)
- **Documentation**: This README and inline code comments
- **Community**: Vim community resources and documentation

---

**Happy Vimming!**
