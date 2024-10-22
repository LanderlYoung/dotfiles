#!/bin/bash
#########################################################################
# File Name:		install.sh
# Author:			Landerl Young
# e-Mail:			LanderlYoung@gmail.com
# Created Time:		Mon Jun 17 18:45:17 2024
#########################################################################

echo depedencies: stow zoxide fzf

stow --dotfiles --ignore=install.sh --target=$HOME .
