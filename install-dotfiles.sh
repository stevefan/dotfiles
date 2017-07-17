#!/usr/bin/env bash

# via http://www.ostricher.com/2014/10/the-right-way-to-get-the-directory-of-a-bash-script/
SCRIPTPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
EXCLUDED_FILES=$SCRIPTPATH/excluded_files

for dotfile in $(comm -23 <(ls -a1 $SCRIPTPATH) <(sort $EXCLUDED_FILES) )
do
  if [ -f $HOME/$dotfile ]
  then mv -v $HOME/$dotfile $SCRIPTPATH/old_dotfiles/$dotfile
  fi
  if [ ! -e $HOME/$dotfile ]
  then ln -sv $SCRIPTPATH/$dotfile $HOME/$dotfile
  fi
done
