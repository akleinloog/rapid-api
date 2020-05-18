FROM node:13.14.0-alpine3.11

RUN apk update 
RUN apk upgrade

WORKDIR /app
VOLUME /app

EXPOSE 8080

COPY entrypoint.sh /usr/local/bin/

RUN chmod 755 "/usr/local/bin/entrypoint.sh"

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]