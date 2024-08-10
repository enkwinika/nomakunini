FROM nginx:1.25.3-alpine

COPY ./www/build /usr/share/nginx/html
COPY ./www/default.conf /etc/nginx/conf.d/default.conf

RUN apk add --no-cache curl

RUN apk update && \
    apk upgrade && \
    apk add --no-cache libx11

EXPOSE 3001

CMD ["nginx", "-g", "daemon off;"]