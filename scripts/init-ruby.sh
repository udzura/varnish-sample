#!/bin/bash

set -e
set -x

[[ -e "/usr/local/ruby-2.1.1/bin/ruby" ]] && exit

yum -y install wget
wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm -Uvh epel-release-6*.rpm
yum -y update

yum -y install \
    make gcc zlib-devel openssl-devel readline-devel \
    ncurses-devel gdbm-devel db4-devel libffi-devel \
    tk-devel libyaml-devel git

git clone https://github.com/sstephenson/ruby-build.git
sh ruby-build/install.sh
/usr/local/bin/ruby-build 2.1.1 /usr/local/ruby-2.1.1

export PATH=/usr/local/ruby-2.1.1/bin:$PATH
gem install bundler -v '~> 1.6.0' --no-ri --no-rdoc

cat <<EOF > /etc/profile.d/ruby211.sh
export PATH=/usr/local/ruby-2.1.1/bin:$PATH
EOF

echo "Success!!"
exit
