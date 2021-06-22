#!/usr/bin/env 

# This file will be load every time you open a new shell. 
# It should only have environment variables you want 
# loaded every time you open a new shell. 
#
# If you want to add any additional customizations (example: oh-my-zsh)
# consider keeping it in your .zshrc file (you can create one).
# 

# Additional information: http://zsh.sourceforge.net/Intro/intro_3.html

# homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH="$PATH:/usr/local/bin/nvim-osx64/bin"
export EDITOR=nvim
export PATH="$PATH:$HOME/.rvm/bin"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-15.jdk/Contents/Home

# pyenv 
eval "$(pyenv init --path)"

export OWL="/Users/tpatel/Coding/owl"
eval "$(pyenv virtualenv-init -)"
