FROM node:20.15.0-alpine3.20
EXPOSE 8080
RUN addgroup -S srinath && adduser -S srinath -G srinath \
    && mkdir /opt/server \
    && chown srinath:srinath -R /opt/server
WORKDIR /opt/server
COPY package.json .
COPY *.js /opt/server/
RUN npm install
USER srinath
CMD [ "node","index.js" ]