FROM debian:latest

WORKDIR /usr/www/

RUN apt-get -y update
RUN apt-get -y install apt-utils
RUN apt-get -y install curl gnupg
RUN apt-get install -y nginx
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash
RUN apt-get install -y nodejs # check with node: --versionk

ADD . .
RUN npm install && \
  npm run build
CMD npm run host
