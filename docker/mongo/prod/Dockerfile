FROM node:13.14.0-alpine3.11

RUN apk update && apk upgrade

WORKDIR /app

ADD ./app/sqlite/package.json /app
ADD ./app/sqlite/yarn.lock /app

RUN yarn install --production --force
RUN yarn build

ADD ./app/sqlite/. /app

ADD ./docker/sqlite/prod/entrypoint.sh /usr/local/bin/

EXPOSE 8080

RUN chmod 755 "/usr/local/bin/entrypoint.sh"

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]