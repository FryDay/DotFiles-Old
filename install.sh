#!/bin/bash

sudo pacman -S --needed - < pkglist.txt

stow config
stow zsh
