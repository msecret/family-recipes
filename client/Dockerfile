FROM debian:latest

WORKDIR /usr/www/
COPY package.json yarn.lock elm-package.json /tmp/

RUN apt-get -y update
RUN apt-get -y install apt-utils
RUN apt-get -y install curl inotify-tools gnupg
RUN apt-get install -y nginx
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash
RUN apt-get install -y nodejs # check with node: --versionk

RUN npm install -g elm
RUN npm install -g elm-test

RUN cd /tmp && \
 elm-package install -y && \
 cd /usr/www/ && \
 ln -s /tmp/node_modules && \
 ln -s /tmp/elm-stuff
COPY . .
CMD elm-reactor -a 0.0.0.0
