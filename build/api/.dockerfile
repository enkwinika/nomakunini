FROM node:19-alpine

RUN mkdir -p /noma/io/api

WORKDIR /noma/io/api

RUN apk update && apk upgrade && apk add --no-cache openssl

RUN yarn global add pm2

# Install tzdata package to set the timezone
RUN apk add --no-cache tzdata \
    && cp /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime \
    && echo "Africa/Johannesburg" > /etc/timezone \
    && apk del tzdata

COPY /api/package.json /api/yarn.lock* ./

RUN yarn --production

COPY /api/. .

# Greg - For Production Remove the # - Set the user to node for security purposes
# USER node

EXPOSE 3002

ENTRYPOINT ["/usr/local/bin/pm2-runtime", "start", "server.js"]


