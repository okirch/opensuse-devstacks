FROM opensuse/leap:latest

RUN zypper in -y python3-base python3-pip python3-setuptools python3-wheel

# pip package is woefully outdated
RUN pip3 install --upgrade pip
ENTRYPOINT [ "/bin/bash" ]
