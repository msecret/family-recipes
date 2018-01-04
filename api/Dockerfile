FROM mhart/alpine-node:8
RUN mkdir www/
WORKDIR www/
ADD . .
RUN npm install --global nodemon
RUN npm install
CMD npm run build && npm run start
