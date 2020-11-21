# .dotfiles

## Overview

This repo contains tools and steps to creating a development environment using iTerm2, Vim, and tmux.

## Installation

### Step 1: Install iTerm2

[https://www.iterm2.com/](https://www.iterm2.com/)

### Step 2: Install dotfiles and tmux

_This step uses [Homebrew](https://brew.sh/) to install MacVim and tmux_

```
mkdir /var/src
git clone https://github.com/crookse/dotfiles.git /var/src/dotfiles
cd ~
ln -s /var/src/dotfiles/ dotfiles
brew install tmux
```

### Step 3: Use Bash by default

I always make sure my default system shell is bash by running the following:

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

### Step 5: Make symlinks to the files inside the `~/dotfiles` directory

```
. ~/dotfiles/dotfiles
```

_Symlinks will be created from `~/dotfiles` to `~/` (e.g., `~/dotfiles/.vim` to `~/.vim`)_

_Sample files will be used to create real files (e.g., `~/.bashrc.sample` to `~/.bashrc`)_

### Step 6: Set up Vim

Install Vim's plugin manager (I use Vundle) ...

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

... open Vim ...

```
vim
```

... and install all plugins listed in `~/.vim/vimrc` by typing `:PluginInstall`.

### Step 7: Install Menlo-ForPowerline font

Install the Menlo-ForPowerline font. The font file is located at `~/dotfiles/assets/fonts/Menlo-ForPowerline.ttc`. On macOS, just double-click the font file.

### Step 8: Set up and run tmux

Install tmux's plugin manager ...

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

... source `tpm` ...

```
tmux source ~/.tmux.conf
```

... and run `tmux` ...

```
tmux
```
