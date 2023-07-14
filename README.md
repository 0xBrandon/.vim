# .vim

My .vim dotfiles for use with the
[vim](http://www.vim.org/download.php) text editor.

# Pathogen

I use [Tim Pope's](https://github.com/tpope) addon
[pathogen.vim](https://github.com/tpope/vim-pathogen)

About pathogen:

> Manage your 'runtimepath' with ease. In practical terms, pathogen.vim makes it
> super easy to install plugins and runtime files in their own private
> directories.

# Current Plugins

* [github.com/vim-airline/vim-airline](https://github.com/vim-airline/vim-airline.git)
* [github.com/vim-airline/vim-airline-themes](https://github.com/vim-airline/vim-airline-themes.git)
* [github.com/morhetz/gruvbox](https://github.com/morhetz/gruvbox.git)
* [github.com/scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)
* [github.com/mbbill/undotree](https://github.com/mbbill/undotree.git)
* [github.com/airblade/vimgutter.git](https://github.com/airblade/vim-gitgutter.git)

# Setup

* $ cd ~
* $ git clone https://github.com/0xBrandon/.vim.git ~/.vim
* $ ln -sf $HOME/.vim/vimrc $HOME/.vimrc
* $ cd ~/.vim
* $ git submodule update --init
