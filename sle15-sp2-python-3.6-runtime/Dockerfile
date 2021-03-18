FROM registry.suse.com/suse/sle15:15.2

ADD SCC/sles15-sp2.tar.gz /etc/zypp
RUN --mount=type=secret,id=scc_credentials \
  cp /run/secrets/scc_credentials /etc/zypp/credentials.d/SCCcredentials

RUN zypper in -y python3-base python3-pip python3-setuptools python3-wheel

# pip package is woefully outdated
RUN pip3 install --upgrade pip

RUN rm -f /etc/zypp/credentials.d/SCCcredentials
RUN zypper rr --all

ENTRYPOINT [ "/bin/bash" ]
