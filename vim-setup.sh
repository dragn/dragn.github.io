#!/bin/sh

echo "Welcome to vim setup script! Property of dragn, use at your own risk..."
echo "These may not work out if you doesn't have unzip (used for plugin installation) installed."
echo ""

# pathogen
#
echo "Installing pathogen..."
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/bundle

# NERDTree
#
echo "NERDTree..."
curl -sSL https://github.com/scrooloose/nerdtree/archive/master.zip -o master.zip
unzip -qu master.zip
rm master.zip

# vim-javascript
#
echo "vim-javascript..."
curl -sSL https://github.com/dragn/vim-javascript/archive/master.zip -o master.zip
unzip -qu master.zip
rm master.zip

# MRU
#
echo "MRU..."
curl -sSL https://github.com/yegappan/mru/archive/master.zip -o master.zip
unzip -qu master.zip
rm master.zip

# Trailing whitespaces
#
echo "vim-trailing-whitespace..."
curl -sSL https://github.com/bronson/vim-trailing-whitespace/archive/master.zip -o master.zip
unzip -qu master.zip
rm master.zip

# vim-istanbul
#
echo "vim-istanbul..."
curl -sSL https://github.com/juanpabloaj/vim-istanbul/archive/master.zip -o master.zip
unzip -qu master.zip
rm master.zip

# install vimrc
#
echo "and finally, .vimrc"
curl -sSL https://dragn.github.io/vimrc -o ~/.vimrc
