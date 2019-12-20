FROM ubuntu:18.04

LABEL version="0.1"
LABEL maintainer="florian.feldhaus@gmail.com"

# skip interactive configuration dialogs
ENV DEBIAN_FRONTEND noninteractive

# add winswitch repository to install Xpra
RUN apt-get update
RUN apt-get install -y gnupg curl software-properties-common
RUN curl http://xpra.org/gpg.asc | apt-key add -
RUN echo "deb http://xpra.org/ bionic main" >> /etc/apt/sources.list.d/xpra.list;

# install xpra and necessary dependencies
RUN apt-get update
RUN apt-get install -y --no-install-recommends python3-xpra xpra

# copy xpra config file
COPY ./xpra.conf /etc/xpra/xpra.conf

# use docker-entrypoint.sh to allow passing options to xpra and start xpra from bash
COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

# create run directory for xpra socket and set correct permissions
RUN mkdir -p /run/user/1000/xpra
RUN chown -R 1000 /run/user/1000

# allow users to read default certificate
RUN chmod 644 /etc/xpra/ssl-cert.pem

# add xpra user
RUN useradd --create-home --shell /bin/bash xpra --gid xpra --uid 1000
USER xpra
WORKDIR /home/xpra
