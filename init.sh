#!/usr/bin/env zsh

link() {
    local src="$1"
    local dst="$2"

    if [[ -L $dst ]]; then 
        rm $dst
    fi

    ln -s $src $dst
}


# ZSH
link $HOME/.dotfiles/zsh/.zshrc $HOME/.zshrc

link $HOME/.dotfiles/zsh/custom/alias.zsh $HOME/.oh-my-zsh/custom/alias.zsh
link $HOME/.dotfiles/zsh/custom/environment.zsh $HOME/.oh-my-zsh/custom/environment.zsh

# files
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

