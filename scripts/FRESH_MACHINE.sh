#!/bin/bash

echo "Well, Start by installing brew... Have to have at least something to work off of..."

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Install zsh and curl...".
brew install zsh curl
echo "Change Shells, because screw bash..."
chsh -s /bin/zsh
echo "Install Oh-My-Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Add Caskroom..."
brew tap caskroom/cask

#Add some more
brew install aws aws-shell git wget googler node openssl sqlite jq docker docker-compose docker-machine Caskroom/versions/atom-beta mas

