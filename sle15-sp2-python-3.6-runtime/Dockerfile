FROM registry.suse.com/suse/sle15:15.2

RUN df

RUN zypper in -y tar gzip
ADD SCC/sles15-sp2.tar.gz /etc/zypp
RUN --mount=type=secret,id=scc_credentials \
  cp /run/secrets/scc_credentials /etc/zypp/credentials.d

RUN zypper in -y python3-base python3-pip python3-setuptools python3-wheel

# pip package is woefully outdated
RUN pip3 install --upgrade pip
ENTRYPOINT [ "/usr/bin/sleep", "infinity" ]
