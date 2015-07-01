FROM kinsamanka/docker-qemu-chroot:wheezy-base

MAINTAINER Crossy.IO <docker@crossy.io>

RUN sh -c 'cp /etc/resolv.conf /opt/rootfs/etc/resolv.conf' && \
proot -r /opt/rootfs -q qemu-arm-static /bin/bash -c 'apt-get update && \
apt-get install -y --force-yes curl python build-essential && \
apt-get clean'
RUN proot -r /opt/rootfs -q qemu-arm-static /bin/bash -c 'curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | bash'
RUN proot -r /opt/rootfs -q qemu-arm-static /bin/bash -c '. ~/.nvm/nvm.sh && nvm install 0.10'
#RUN proot -r /opt/rootfs -q qemu-arm-static /bin/bash -c '. ~/.nvm/nvm.sh && nvm install 0.12'
#RUN proot -r /opt/rootfs -q qemu-arm-static /bin/bash -c '. ~/.nvm/nvm.sh && nvm install iojs'
#RUN proot -r /opt/rootfs -q qemu-arm-static sh -c 'cd /tmp && curl -LO https://github.com/npm/npm/archive/v2.12.0.tar.gz && tar zxf v2.12.0.tar.gz && rm -rf /usr/local/lib/node_modules/npm && mv npm-2.12.0 /usr/local/lib/node_modules/npm'
#RUN proot -r /opt/rootfs -q qemu-arm-static npm install -g node-pre-compile-to-s3
