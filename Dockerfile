FROM fedora:latest
MAINTAINER Michael Gruener <michael.gruener@chaosmoon.net>

RUN dnf -y install \
    mock \
    rpm-build \
    rpmdevtools \
    sudo && \
    dnf clean all

RUN useradd -m rpmbuild && \
    echo "rpmbuild ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/rpmbuild

USER rpmbuild
WORKDIR /home/rpmbuild

CMD ["/bin/bash"]
