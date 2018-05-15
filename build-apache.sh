set -e

rm -rf apache-build
cp -r apache apache-build
cd apache-build

#      --enable-layout=Arch \

./configure \
      --sbindir=/usr/bin \
      --enable-mpms-shared=all \
      --enable-modules=all \
      --enable-mods-shared=all \
      --enable-so \
      --enable-suexec \
      --with-suexec-caller=http \
      --with-suexec-docroot=/srv/http \
      --with-suexec-logfile=/var/log/httpd/suexec.log \
      --with-suexec-bin=/usr/bin/suexec \
      --with-suexec-uidmin=99 --with-suexec-gidmin=99 \
      --enable-ldap --enable-authnz-ldap --enable-authnz-fcgi \
      --enable-cache --enable-disk-cache --enable-mem-cache --enable-file-cache \
      --disable-ssl --without-ssl \
      --enable-deflate --enable-cgi --enable-cgid \
      --enable-proxy --enable-proxy-connect \
      --enable-proxy-http --enable-proxy-ftp \
      --enable-dbd --enable-imagemap --enable-ident --enable-cern-meta \
      --disable-lua --enable-xml2enc --enable-http2 \
      --enable-proxy-http2 --enable-md --enable-brotli \
      --with-apr=/usr/bin/apr-1-config \
      --with-apr-util=/usr/bin/apu-1-config \
      --with-pcre=/usr
make -j3
