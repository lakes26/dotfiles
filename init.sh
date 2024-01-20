#!/usr/bin/env zsh

link() {
    local src="$1"
    local dst="$2"

    if [[ -L $dst ]]; then 
        rm $dst
    fi

    ln -s $src $dst
}

# files
link $HOME/.dotfiles/.zshrc $HOME/.zshrc
link $HOME/.dotfiles/.yabairc $HOME/.yabairc
link $HOME/.dotfiles/.skhdrc $HOME/.skhdrc
link $HOME/.dotfiles/.gitconfig $HOME/.gitconfig

# .config
link $HOME/.dotfiles/nvim $HOME/.config/nvim
link $HOME/.dotfiles/kitty $HOME/.config/kitty
link $HOME/.dotfiles/tmux/ $HOME/.config/tmux

# directories
link $HOME/.dotfiles/zshrc_private $HOME/.zshrc_private
link $HOME/.dotfiles/bin $HOME/bin

# link $HOME/.dotfiles to PWD
link $(pwd) $HOME/.dotfiles

