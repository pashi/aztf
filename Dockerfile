#20210719
FROM ubuntu:20.04
MAINTAINER pasi@pashi.net
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -f -y install ca-certificates curl apt-transport-https lsb-release gnupg
RUN echo 'deb https://apt.releases.hashicorp.com focal main' > /etc/apt/sources.list.d/hashicorp.list
RUN echo 'deb https://packages.microsoft.com/repos/azure-cli/ focal main' > /etc/apt/sources.list.d/azure-cli.list
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg > hashicorp.gpg
RUN curl -fsSL https://packages.microsoft.com/keys/microsoft.asc > microsoft.asc
RUN apt-key add - < hashicorp.gpg
RUN apt-key add - < microsoft.asc
RUN apt-get update; apt-get -f -y install terraform azure-cli
WORKDIR /app
VOLUME ["/app"]
