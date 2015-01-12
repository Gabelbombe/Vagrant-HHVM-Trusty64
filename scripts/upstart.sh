#!/bin/bash
# HipHop VM installer for Ubuntu 14.04 x64 LTS

# CPR : Jd Daniel :: Ehime-ken
# MOD : 2015-01-12 @ 14:28:11
# VER : Version 1

echo "==> Disabling Firewall..."
sudo ufw disable

if ! hash git 2>/dev/null; then
  echo "==> Installing GIT Core..."
  sudo apt-get install -y git
  then

  echo "==> Updating..."
  sudo apt-get -y update
  sudo apt-get -y upgrade


  echo "Installing required packages..."
  sudo apt-get install -y autoconf automake binutils-dev build-essential cmake g++ gawk git 	\
  libboost-dev libboost-filesystem-dev libboost-program-options-dev libboost-regex-dev 		\
  libboost-system-dev libboost-thread-dev libbz2-dev libc-client-dev libldap2-dev 			\
  libc-client2007e-dev libcap-dev libcurl4-openssl-dev libdwarf-dev libelf-dev 				\
  libexpat-dev libgd2-xpm-dev libgoogle-glog-dev libgoogle-perftools-dev libicu-dev 		\
  libjemalloc-dev libmcrypt-dev libmemcached-dev libmysqlclient-dev libncurses-dev 			\
  libonig-dev libpcre3-dev libreadline-dev libtbb-dev libtool libxml2-dev zlib1g-dev 		\
  libevent-dev libmagickwand-dev libinotifytools0-dev libiconv-hook-dev libedit-dev 		\
  libiberty-dev libxslt1-dev ocaml-native-compilers libsqlite3-dev libyaml-dev libgmp3-dev 	\
  php5


  echo "==> Creating install dir...."
  ROOT='/tmp/HHVM-Install'
  mkdir $ROOT && cd $_


  ## Get HipHop source code....
  echo "Building the HipHop Virtual Machine..."
  git clone git://github.com/facebook/hhvm.git --depth=1 && cd hhvm
  git submodule update --init --recursive
  cmake .
  make -j 4

  sudo make install

  echo "==> Reenabling Firewall"
  sudo ufw enable
