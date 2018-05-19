#Dockerfile for Spinning up ABS Instances.
FROM base/archlinux:latest
LABEL maintainer "James Griffis <setkeh@gmail.com>"

RUN pacman-key --init && \
    pacman-key --populate archlinux && \
    pacman -Syu --noconfirm --ignore filesystem && \
    pacman -S zsh abs git --noconfirm && \
    useradd -m -d /home/docker -p docker docker

RUN git clone https://github.com/setkeh/Docker-Home.git /tmp/home/ && \
    cp -r /tmp/home/.vim/ /home/docker/.vim/ && \
    cp -r /tmp/home/.vimrc /home/docker/.vimrc && \
    cp -r /tmp/home/.zshrc /home/docker.zshrc && \
    rm -rf /tmp/home/ && \
    chsh -s /bin/zsh docker && \
    mkdir -p /home/docker/abs && \
    chown -R docker:users /home/docker && \
    abs

ENTRYPOINT [ "/bin/bash" ]