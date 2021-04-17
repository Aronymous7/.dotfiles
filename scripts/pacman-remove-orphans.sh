#!/usr/bin/env bash

pacman -Qtdq > ~/removed-orphans.txt
sudo pacman -Rns - < ~/removed-orphans.txt
