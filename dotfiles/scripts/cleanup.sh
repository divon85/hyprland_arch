#!/usr/bin/env sh

sudo pacman -Rns $(pacman -Qtdq)

yay -Scc