FROM node:13.14.0-alpine3.11

ARG VERSION
ARG VCS_REF
LABEL maintainer="arnoud@kleinloog.ch" \
    description="Rapid API Prototyping" \
    version=${VERSION} \
    vcs_url="https://github.com/akleinloog/rapid-api" \
    vcs-ref=${VCS_REF}

RUN apk update && apk upgrade && yarn global add strapi

WORKDIR /app

RUN strapi new . --dbclient mongo --dbhost rapid-api-db --dbport 27017 --dbname strapi --dbusername strapi --dbpassword strapi --dbforce --debug --no-run && \
    yarn install --force

RUN strapi install documentation && strapi install graphql

COPY entrypoint.sh /usr/local/bin/

RUN chmod 755 "/usr/local/bin/entrypoint.sh"

EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
