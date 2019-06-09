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
git clone https://github.com/crookse/dotfiles.git ~/var/src/dotfiles
ln -s ~/usr/local/dotfiles ~/dotfiles
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Installation: Set up Vim

Open Vim ...

```
vim
```

... and install its plugins

```
:PluginInstall
```

### Installation: Install Menlo-ForPowerline font

Install the Menlo-ForPowerline font. Font file is located at `~/dotfiles/assets/fonts/Menlo-ForPowerline.ttc`. On macOS, just double-click the `.ttc` file.

### Installation: Set up tmux

Open tmux ...

```
tmux
```

`Ctrl+s` + `I`
