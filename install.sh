#!/bin/bash

# The base directory incudes the git files location ex: "home/user/git/dotfiles"
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "------------------------------------------------"
echo "- Checking if file/dirs exist, overwriting -----"
echo "------------------------------------------------"

# vim 
if [[ -f ~/.vimrc ]]
then 
    echo "FILE CHANGE: replacing  old .vimrc file"
    rm ~/.vimrc
    ln -s ${BASEDIR}/vimrc ~/.vimrc
else
    echo "NEW FILE: creating new .vimrc file"
    ln -s ${BASEDIR}/vimrc ~/.vimrc
fi

if [[ -d ~/.vim ]]
then 
    echo "DIR  CHANGE: replacing old .vim directory"
    rm -r ~/.vim
    ln -s ${BASEDIR}/vim/ ~/.vim
else 
    echo "NEW DIR: creating new .vim/ directory"
    ln -s ${BASEDIR}/vim/ ~/.vim
fi 

# zsh
if [[ -f ~/.zshrc ]]
then 
    echo "FILE CHANGE: .zshrc already exists, replacing with newer version"
    rm ~/.zshrc 
    ln -s ${BASEDIR}/zshrc ~/.zshrc
else
    echo "NEW FILE: creating new .zshrc file"
    ln -s ${BASEDIR}/zshrc ~/.zshrc
fi 
if [[ -d ~/.zsh ]]
then 
    echo "DIR  CHANGE: replacing zsh dir"
    rm -r ~/.zsh
    ln -s ${BASEDIR}/zsh ~/.zsh
else
    echo "NEW DIR: adding zsh directory"
    ln -s ${BASEDIR}/zsh ~/.zsh
fi


# git - Not yet created
#if [[ -f ~/.gitconfig ]]
#then 
#    echo "FILE CHANGE: removing old gitconfig file"
#    rm ~/.gitconfig
#    ln -s ${BASEDIR}/gitconfig ~/.gitconfig
#else
#    echo "NEW FILE: creating new gitconfig"
#    ln -s ${BASEDIR}/gitconfig ~/.gitconfig
#fi

# bash
if [[ -d ~/.bash ]]
then 
    echo "DIR  CHANGE: replacing old bash directory"
    rm -r ~/.bash
    ln -s ${BASEDIR}/bash/ ~/.bash
else
    echo "NEW DIR: creating new bash directory"
    ln -s ${BASEDIR}/bash/ ~/.bash
fi

if [[ -f ~/.bashrc ]]
then 
    echo "FILE CHANGE: replacing old bashrc file"
    rm ~/.bashrc
    ln -s ${BASEDIR}/bashrc ~/.bashrc
else
    echo "NEW FILE: creating new bashrc file"
    ln -s ${BASEDIR}/bashrc ~/.bashrc
fi

# shell - (common commands to bash and zsh)
if [[ -d ~/.shell ]]
then 
    echo "DIR  CHANGE: replacing shell directory"
    rm -r ~/.shell
    ln -s ${BASEDIR}/shell/ ~/.shell
else
    echo "NEW DIR: creating shell directory"
    ln -s ${BASEDIR}/shell/ ~/.shell
fi

echo "Successfully finished installing dot files"
echo "To modify config files, modify source at ${BASEDIR}, and then run 'install.sh'"
