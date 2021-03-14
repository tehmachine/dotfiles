#!/bin/bash

# Build and install Vim on Debian (and other distros)
sudo apt remove --purge -y vim vim-tiny;
sudo apt autoremove -y;
sudo apt install -y lua5.3 liblua5.3-dev luajit python3-dev;
mkdir ~/vim_temp
cd ~/vim_temp;
git clone https://github.com/vim/vim.git;
cd vim;
./configure --with-features=huge --enable-luainterp=yes --enable-python3interp --enable-rubyinterp --with-lua-prefix=/usr/include/lua5.3 --with-python-config-dir=/usr/lib/python3.7/config-3.7m-x86_64-linux-gnu;
make;
sudo make uninstall;
sudo make install -j 4;
cd ~;
rm -rf ~/vim_temp;
