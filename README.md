# .dotfiles

## Overview

This repo contains dotfiles (e.g., `.somefile`) for a development environment setup. It includes the following:

* Vim configurations
* tmux configurations
* iTerm2 configurations

## Installation

Install dotfiles, Vim, and tmux

```
brew install vim
brew install tmux
git clone https://github.com/crookse/dotfiles.git ~/usr/local/dotfiles
ln -s ~/usr/local/dotfiles ~/dotfiles
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Open Vim ...

```
vim
```

... and install its plugins

```
:PluginInstall
```