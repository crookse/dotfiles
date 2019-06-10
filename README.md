# .dotfiles

## Overview

This repo contains dotfiles (e.g., `.somefile`) for a development environment setup. It includes the following:

* MacVim configurations (these configurations also work for Vim)
* tmux configurations
* iTerm2 configurations

I use MacVim to easily solve the clipboard issues in tmux and split screen resizing issues in Vim.

## Installation

### Step 1: Install dotfiles, MacVim, and tmux

_This step uses [Homebrew](https://brew.sh/) to install MacVim and tmux_

```
mkdir /var/src
git clone https://github.com/crookse/dotfiles.git /var/src/dotfiles
ln -s /var/src/dotfiles ~/dotfiles
brew install macvim
brew install tmux
```

### Step 2: Make symlinks to dotfiles and copies of sample files

_Symlinks will be created from `~/dotfiles` to `~/` (e.g., `~/dotfiles/.vim ~/.vim`)_

_Sample files will be used to create real files (e.g., `~/.bashrc.sample` to ``~/.bashrc)_

```
~/dotfiles/dotfiles
```

### Step 3: Set up MacVim

Install MacVim's plugin manager (I use Vundle) ...

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

... open MacVim ...

```
macvim -v
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
