FROM keymetrics/pm2:latest-alpine
ENV NPM_CONFIG_LOGLEVEL warn
RUN apt-get update && apt-get install -y \
curl
RUN mkdir -p /usr/src/app
EXPOSE 3000
WORKDIR /usr/src/app
ADD package.json /usr/src/app/
RUN npm install --production
ADD . /usr/src/app/
ENTRYPOINT ["npm", "start"]
