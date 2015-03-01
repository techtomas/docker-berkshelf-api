FROM debian:wheezy

MAINTAINER Thomas Anderson <me@tjanderson.net>

# Keep system up to date and grab wget for the rest of the runs
RUN apt-get update && apt-get install -y wget

# Grab chefdk from Chef to get working ruby env with all needed pieces
RUN cd /tmp && \
wget --no-check-certificate https://opscode-omnibus-packages.s3.amazonaws.com/debian/6/x86_64/chefdk_0.4.0-1_amd64.deb && \
dpkg -i /tmp/chefdk_0.4.0-1_amd64.deb && \
rm /tmp/chefdk_0.4.0-1_amd64.deb

RUN eval "$(chef shell-init sh)"; chef gem install berkshelf-api

VOLUME ["/opt/berkshelf-api"]

WORKDIR /opt/berkshelf-api

COPY berkshelf-api.sh ./

EXPOSE 26200

COPY config.json client.pem ./

ENTRYPOINT ["./berkshelf-api.sh"]
CMD ["-c /opt/berkshelf-api/config.json"]
