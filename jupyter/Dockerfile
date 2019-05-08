FROM jupyterhub/singleuser
LABEL maintainer "James Griffis <setkeh@gmail.com>"
ARG NB_USER="jovyan"
ARG NB_UID="1000"
ARG NB_GID="100"

ENV DEBIAN_FRONTEND noninteractive
ENV GOPATH=/opt/go

USER root
RUN apt-get -y update && \
    apt-get -y install golang-go pkg-config nodejs npm libtool build-essential autoconf automake git libtool && \
    apt-get purge && \
    apt-get clean && \
rm -rf /var/lib/apt/lists/*

RUN git clone git://github.com/jedisct1/libsodium.git && \
    cd libsodium && \
    ./autogen.sh && \
    ./configure && make check && \
    make install && \
    ldconfig && \
    cd .. && \
    rm -rf libsodium/

RUN wget http://download.zeromq.org/zeromq-4.1.2.tar.gz  && \
    tar -xvf zeromq-4.1.2.tar.gz && \
    cd zeromq-4.1.2 && \
    ./autogen.sh && \
    ./configure && make check && \
    sudo make install && \
    sudo ldconfig && \
    cd .. && \
    rm -rf zeromq-4.1.2/ zeromq-4.1.2.tar.gz
USER $NB_UID

RUN mkdir -p $GOPATH/{src,bin,pkg} && \
    go get -u github.com/gopherdata/gophernotes && \
    mkdir -p ~/.local/share/jupyter/kernels/gophernotes && \
    cp $GOPATH/src/github.com/gopherdata/gophernotes/kernel/* ~/.local/share/jupyter/kernels/gophernotes

RUN pip install jupyter_c_kernel bash_kernel

RUN git clone https://github.com/notablemind/jupyter-nodejs.git && \
    cd jupyter-nodejs && \
    mkdir -p ~/.ipython/kernels/nodejs/ && \
    npm install && node install.js && \
    npm run build && \
    npm run build-ext