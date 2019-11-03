# .dotfiles

## Overview

This repo contains dotfiles (e.g., `.somefile`) for a development environment setup. It includes the following:

* MacVim configurations (these configurations also work for Vim)
* tmux configurations
* iTerm2 configurations

I use MacVim to easily solve the clipboard issues in tmux and split screen resizing issues in Vim.

These instructions assume you are using macOS.

## Installation

### Step 1: Install iTerm2

[https://www.iterm2.com/](https://www.iterm2.com/)

### Step 2: Install dotfiles, MacVim, and tmux

_This step uses [Homebrew](https://brew.sh/) to install MacVim and tmux_

```
mkdir /var/src
git clone https://github.com/crookse/dotfiles.git /var/src/dotfiles
ln -s /var/src/dotfiles ~/dotfiles
brew install macvim
brew install tmux
```

### Step 3: Use Bash

I make sure my default system shell is bash by running the following:

```
chsh -s /bin/bash
```

### Step 4: (optional) Set up iTerm2 color preset

I like [Theme - Glacier](https://packagecontrol.io/packages/Theme%20-%20Glacier) from Sublime, so I made an iTerm2 color preset to kind of match the Glacier theme.

* Open iTerm2 and press `cmd` + `,` to open the Preferences.
* Go to Profiles > Colors.
* In the bottom right corner, open the "Color Presets..." dropdown menu and select the "Import..." option.
* Navigate to `~/dotfiles/assets/itermcolors` and select `crookse_glacier.itermcolors`.
* Once `crookse_glacier` is imported, open the dropdown menu again and select `crookse_glacier`.

### Step 5: Make symlinks to dotfiles and copies of sample files

```
~/dotfiles/dotfiles
```

_Symlinks will be created from `~/dotfiles` to `~/` (e.g., `~/dotfiles/.vim ~/.vim`)_

_Sample files will be used to create real files (e.g., `~/.bashrc.sample` to `~/.bashrc`)_

### Step 6: Set up MacVim

Install MacVim's plugin manager (I use Vundle) ...

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

... open MacVim ...

```
mvim -v
```

... and install all plugins listed in `~/.vim/vimrc` by typing `:PluginInstall`.

### Step 7: Install Menlo-ForPowerline font

Install the Menlo-ForPowerline font. The font file is located at `~/dotfiles/assets/fonts/Menlo-ForPowerline.ttc`. On macOS, just double-click the font file.

### Step 8: Set up tmux

Install tmux's plugin manager ...

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

... open tmux ...

```
tmux
```

... and install all plugins listed in the `~/.tmux/plugins` directory by pressing `Ctrl+s` + `I`. I have configured the tmux prefix to be `Ctrl+s`. The original prefix is `Ctrl+b`.
