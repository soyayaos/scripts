#!/bin/bash

sudo apt -y install \
    ca-certificates \
    curl \
    fakeroot \
    fio \
    fuse \
    git \
    gnupg \
    htop \
    inetutils-traceroute \
    iperf3 \
    iproute2 \
    iputils-ping \
    make \
    mc \
    net-tools \
    postgresql-client \
    protobuf-compiler \
    secure-delete \
    subversion \
    tree \
    unar \
    unrar \
    whois \
    wrk

#
# tuning: apport
#
echo "enabled=0" | sudo tee /etc/default/apport
sudo service apport stop

#
# tuning: bash
#
echo "
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
" | tee -a $HOME/.bashrc

#
# fix: mc
# https://bbs.archlinux.org/viewtopic.php?id=288511
#
cp -a /etc/mc/mc.ext.ini /etc/mc/mc.ext.ini.bak
sed '/Regex=/s/\\/\\\\/g' -i /etc/mc/mc.ext.ini

#
# tuning: updates
#
echo -e "APT::Periodic::Update-Package-Lists \"0\";\nAPT::Periodic::Unattended-Upgrade \"0\";" | sudo tee /etc/apt/apt.conf.d/20auto-upgrades
sudo systemctl stop unattended-upgrades.service
sudo systemctl disable unattended-upgrades.service
sudo systemctl stop apt-daily.timer
sudo systemctl disable apt-daily.timer
sudo systemctl stop apt-daily-upgrade.timer
sudo systemctl disable apt-daily-upgrade.timer
sudo mv /etc/cron.daily/apt-compat /etc/cron.daily/apt-compat.disabled
sudo chmod -x /etc/cron.daily/apt-compat.disabled

#
# git
#
git config --global init.defaultBranch main

#
# go
#
cd /tmp
wget -c https://go.dev/dl/go1.23.0.linux-amd64.tar.gz
sudo rm -rf /usr/local/go 
sudo tar -C /usr/local -xzf go1.23.0.linux-amd64.tar.gz

#
# go: protoc
#
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

#
# go: grpccurl
#
go install github.com/fullstorydev/grpcurl/cmd/grpcurl@latest

#
# go: migrate
#
cd /tmp
wget https://github.com/golang-migrate/migrate/releases/download/v4.17.1/migrate.linux-amd64.deb
sudo apt -y install ./migrate.linux-amd64.deb

#
# mysql: cli
#
sudo apt -y install mysql-client

#
# nodejs
#
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
source ~/.bashrc
nvm install 20.16.0
curl -fsSL https://get.pnpm.io/install.sh | sh -

#
# qemu
#
sudo apt -y install qemu-system-x86
