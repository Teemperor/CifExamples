set -e

rm -rf openssh-build
cp -r openssh openssh-build
cd openssh-build

patch -p1 -i openssl-1.1.0.patch
    ./configure \
        --prefix=/usr \
        --sbindir=/usr/bin \
        --libexecdir=/usr/lib/ssh \
        --sysconfdir=/etc/ssh \
        --with-ldns \
        --with-libedit \
        --with-ssl-engine \
        --with-pam \
        --with-privsep-user=nobody \
        --with-kerberos5=/usr \
        --with-xauth=/usr/bin/xauth \
        --with-md5-passwords \
        --with-pid-dir=/run \
        --with-default-path='/usr/local/sbin:/usr/local/bin:/usr/bin'
make -j3
