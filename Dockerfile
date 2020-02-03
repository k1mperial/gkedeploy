FROM node
ENV NPM_CONFIG_LOGLEVEL warn
RUN mkdir -p /usr/src/app
EXPOSE 3000
WORKDIR /usr/src/app
ADD package.json /usr/src/app/
RUN npm install --production
RUN npm install pm2 -g
ADD . /usr/src/app/
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]