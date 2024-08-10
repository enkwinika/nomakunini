FROM nginx:1.25.3-alpine

COPY ./ui/build /usr/share/nginx/html
COPY ./ui/default.conf /etc/nginx/conf.d/default.conf

RUN apk add --no-cache curl

RUN apk update && \
    apk upgrade && \
    apk add --no-cache libx11

EXPOSE 3000

CMD ["nginx", "-g", "daemon off;"]