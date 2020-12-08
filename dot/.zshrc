#!/usr/bin/env zsh

for zshrc_part in ~/.zsh/*.zsh; do
  source $zshrc_part
done
unset zshrc_part
