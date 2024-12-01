# .vim

My Vim configuration files and setup.

# .vim

![Vim Version](https://img.shields.io/badge/vim-8.1%2B-green.svg)
![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Platform](https://img.shields.io/badge/platform-macOS%20%7C%20Linux-lightgrey.svg)
![Last Commit](https://img.shields.io/github/last-commit/0xBrandon/.vim)
<!-- [![GitHub stars](https://img.shields.io/github/stars/0xBrandon/.vim)](https://github.com/0xBrandon/.vim/stargazers)
[![GitHub issues](https://img.shields.io/github/issues/0xBrandon/.vim)](https://github.com/0xBrandon/.vim/issues) -->

[Rest of README content...]

![Vim Logo](https://raw.githubusercontent.com/vim/vim/master/runtime/vimlogo.gif)

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Plugin List](#plugin-list)
- [Additional Setup](#additional-setup)
- [Customization](#customization)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

## Overview

This repository contains my personal Vim configuration, optimized for:
- Modern web development
- Python, Go, and Rust development
- Git integration
- Enhanced UI and navigation
- Code completion and linting

## Features
- 🔍 Fuzzy file finding and search
- 🎨 Modern theme support
- 📝 Intelligent code completion
- 🔧 Async linting
- 🌳 File tree navigation
- 🔄 Git integration
- ⚡ Fast startup time
- 🧰 Language server protocol support

## Prerequisites

### Required
- Vim 8.1+
- Git
- Node.js 14+
- ripgrep
- curl

### Optional (Language Specific)
- Python 3.6+
- Go 1.11+
- Rust
- npm/yarn

## Installation

### Quick Install
```bash
git clone https://github.com/0xBrandon/.vim.git ~/.vim
ln -sf $HOME/.vim/vimrc $HOME/.vimrc
vim +PlugInstall +qall
```

### Manual Setup
1. Clone the repository:
```bash
git clone https://github.com/0xBrandon/.vim.git ~/.vim
```

2. Create symlink for vimrc:
```bash
ln -sf $HOME/.vim/vimrc $HOME/.vimrc
```

3. Install vim-plug (will be auto-installed on first vim launch)

4. Open vim and install plugins:
```vim
:PlugInstall
```

5. Install CoC extensions:
```vim
:CocInstall coc-json coc-git coc-pyright coc-rust-analyzer coc-tsserver coc-html coc-css coc-prettier coc-go
```

## Plugin List

[Detailed plugin list from previous version...]

## Additional Setup

### macOS
```bash
brew install ripgrep node
```

### Ubuntu/Debian
```bash
apt install ripgrep nodejs
```

### Arch Linux
```bash
pacman -S ripgrep nodejs
```

## Customization

The configuration is modular and easy to customize:
- Modify `~/.vimrc` for general settings
- Add language-specific settings in FileType sections
- Customize key mappings in the Key Mappings section


## Quick Start Guide

After installation, here are the essential commands to get started:
1. `:Files` - Fuzzy find files
2. `:Rg` - Search in files
3. `gd` - Jump to definition
4. `,t` - Toggle file tree
5. `,u` - Toggle undo history

## Troubleshooting

### Common Issues

1. **Plugin Installation Fails**
   - Ensure you have git installed
   - Check your internet connection
   - Run `:PlugInstall` again

2. **CoC Errors**
   - Ensure Node.js is installed
   - Check CoC log with `:CocInfo`
   - Reinstall CoC extensions

3. **Performance Issues**
   - Check startup time with `vim --startuptime startup.log`
   - Consider disabling unused plugins
   - Update plugins regularly

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Updates and Maintenance

- Configuration is regularly updated
- Check the [releases page](https://github.com/0xBrandon/.vim/releases) for updates
- Star the repo to follow updates

## Version History

See the [releases page](https://github.com/0xBrandon/.vim/releases) for version history.

## Acknowledgments

- All plugin authors and maintainers
- The Vim community
- [Vim documentation](https://www.vim.org/docs.php)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

⭐ Star this repo if you find it useful!

