# .dotfiles

## Overview

This repo contains dotfiles (e.g., `.somefile`) for a development environment setup. It includes the following:

* Vim configurations
* tmux configurations
* iTerm2 configurations

## Installation

### Step 1: Install dotfiles, Vim, and tmux

_This step uses [Homebrew](https://brew.sh/) to install Vim and tmux_

```
mkdir /var/src
git clone https://github.com/crookse/dotfiles.git /var/src/dotfiles
ln -s /var/src/dotfiles ~/dotfiles
brew install vim
brew install tmux
```

### Step 2: Make symlinks to dotfiles

_Symlinks will be created from `~/dotfiles` to `~/` (e.g., `~/dotfiles/.vim ~/.vim`)_

```
~/dotfiles/dotfiles
```

### Step 3: Set up Vim

Install Vim's plugin manager (I use Vundle) ...

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

... open Vim ...

```
vim
```

... and install all plugins listed in `~/.vim/vimrc` by typing `:PluginInstall`.

### Step 4: Install Menlo-ForPowerline font

Install the Menlo-ForPowerline font. The font file is located at `~/dotfiles/assets/fonts/Menlo-ForPowerline.ttc`. On macOS, just double-click the font file.

### Step 5: Set up tmux

Install tmux's plugin manager ...

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

... open tmux ...

```
tmux
```

... and install all plugins listed in the `~/.tmux/plugins` directory ...

`Ctrl+s` + `I`
