FROM node:13.14.0-alpine3.11

ARG VERSION
ARG VCS_REF
ARG PORT_NR=8080 

LABEL maintainer="arnoud@kleinloog.ch" \
    description="Rapid API Prototyping" \
    version=${VERSION} \
    vcs_url="https://github.com/akleinloog/rapid-api" \
    vcs-ref=${VCS_REF}

ENV PORT=$PORT

RUN apk update && apk upgrade && yarn global add strapi

WORKDIR /app

RUN strapi new . --quickstart --no-run && yarn install --force
RUN strapi install documentation && strapi install graphql

COPY entrypoint.sh /usr/local/bin/

RUN chmod 755 "/usr/local/bin/entrypoint.sh"

EXPOSE 1337

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
