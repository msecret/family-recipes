FROM debian:latest

WORKDIR /usr/www/

RUN apt-get -y update
RUN apt-get -y install apt-utils
RUN apt-get -y install curl gnupg
RUN apt-get install -y nginx
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash
RUN apt-get install -y nodejs

ADD . .
RUN npm install -g elm
RUN elm-package install -y
RUN npm install && \
  npm run build
CMD nginx -t -c /usr/www/server/nginx.conf
