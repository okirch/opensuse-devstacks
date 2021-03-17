FROM sle:15.2

RUN df
COPY SCC/sles15-sp2.tar.gz /tmp/scc.tar.gz
RUN tar -C /etc/zypp -xzf /tmp/scc.tar.gz
COPY SCCcredentials /etc/zypp/credentials.d

RUN zypper in -y python3-base python3-pip python3-setuptools python3-wheel

# pip package is woefully outdated
RUN pip3 install --upgrade pip
ENTRYPOINT [ "/usr/bin/sleep", "infinity" ]
