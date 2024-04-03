#!/bin/bash

echo "installing nginx ..."

if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root"
    exit 1
fi

BRANCH="stable-1.24"
TMP_DIR=/tmp/nginx_tmp

function check_error {
    code=$?
    if [ $code -gt 0 ]; then
        echo "error_code = $code"
        exit 1
    fi
}

apt update
check_error
apt install -y \
  gcc \
  git \
  libgd-dev \
  libgeoip-dev \
  libpcre3 \
  libpcre3-dev \
  libssl-dev \
  libxslt-dev \
  make \
  mercurial \
  zlib1g-dev
check_error

rm -rf $TMP_DIR
check_error
mkdir $TMP_DIR
check_error
cd $TMP_DIR
check_error
hg clone -r $BRANCH https://hg.nginx.org/nginx
check_error
cd nginx
check_error
hg clone http://hg.nginx.org/njs
check_error
git clone https://github.com/google/ngx_brotli
check_error
cd ngx_brotli
check_error
git submodule update --init
check_error
cd $TMP_DIR/nginx
check_error

./auto/configure \
    --sbin-path=/usr/sbin/nginx \
    --conf-path=/etc/nginx/nginx.conf \
    --with-compat \
    --with-file-aio \
    --with-http_addition_module \
    --with-http_auth_request_module \
    --with-http_image_filter_module \
    --with-http_geoip_module \
    --with-http_gunzip_module \
    --with-http_gzip_static_module \
    --with-http_realip_module \
    --with-http_secure_link_module \
    --with-http_slice_module \
    --with-http_ssl_module \
    --with-http_stub_status_module \
    --with-http_sub_module \
    --with-http_v2_module \
    --with-pcre-jit \
    --with-stream \
    --with-stream_geoip_module \
    --with-stream_realip_module \
    --with-stream_ssl_module \
    --with-stream_ssl_preread_module \
    --with-threads \
    --add-module=./njs/nginx \
    --add-module=./ngx_brotli
check_error

make -j12
check_error

make install
check_error

nginx -V
check_error

rm -rf TMP_DIR
check_error

echo "done"
