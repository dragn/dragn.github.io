#!/bin/sh

echo "Welcome to vim setup script! Property of dragn, use at your own risk..."
echo "These may not work out if you doesn't have unzip (used for plugin installation) installed."
echo ""

# pathogen
#
echo "Installing pathogen..."
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# NERDTree
#
echo "NERDTree..."
cd ~/.vim/bundle
curl -sSL https://github.com/scrooloose/nerdtree/archive/master.zip -o master.zip
unzip -qu master.zip
rm master.zip

# vim-javascript
#
echo "vim-javascript"
cd ~/.vim/bundle
curl -sSL https://github.com/dragn/vim-javascript/archive/master.zip -o master.zip
unzip -qu master.zip
rm master.zip

# install neat-vimrc
#
echo "and finally, .vimrc"
curl -sSL https://dragn.github.io/vimrc -o ~/.vimrc
