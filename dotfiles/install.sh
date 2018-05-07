#!/bin/bash

ROOT="`pwd`"

set -e

info () {
    printf "\r\033[00;m$1\033[0m\n"
}

warning () {
    printf "\r\033[00;33m$1\033[0m\n"
}

error () {
    printf "\r\033[00;31m$1\033[0m\n"
}

success () {
    printf "\r\033[00;32m$1\033[0m\n"
}

install () {
    info 'installing dotfiles'

    for dotfile in `ls`
    do
        if [ "$dotfile" == "install.sh" ] || [ "$dotfile" == "README.md" ]
        then
            continue
        fi
        if [ "$dotfile" == "tmux.conf" ]
        then
            dest="$HOME/.tmux.conf"
        else
            dest="$HOME/.`basename \"${dotfile%.*}\"`"
        fi
	echo $dest
        rm -rf $dest
        ln -s $ROOT/$dotfile $dest
        success "linked $ROOT/$dotfile -> $dest"
    done

}

setup_vim () {
    info "setting up vim"
    vim_version=`vim --version | head -1 | grep -o '[[:digit:]]\.[[:digit:]]'` 
    info 'vim version: '$vim_version
}

install_vim_bundles () {
    info 'installing vim bundles'
    vim -c 'PluginInstall' -c 'qa'
    success 'bundles installed'
}

install
setup_vim
install_vim_bundles
info "done"
