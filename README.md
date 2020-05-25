# rapid-api

An approach for rapid API prototyping for RESTful and GraphQL based APIs

## Initialize

Initialize strapi project in dev container
```
docker-compose up --build
```

## Customize

Login at http://localhost:1337/admin and create first admin account),
Credentials:  
admin  
Admin123
fake@fake.com

Customize settings as desired. When finished copy strapi project sources.

## Copy Sources

Copy strapi project sources from dev container
```
docker cp dev:/app/. ./src
```

## Customize Sources

See strapi docs for more details.

## Production Build

```
docker-compose -f docker-compose.prod.yaml up --build
```



## Old Docker Compose

version: '3.7'
services:
  dev:
    container_name: dev
    build: ./docker/dev
    ports:
      - '1337:1337'
    volumes:
      - ./src:/app


## Old Docker File

FROM node:13.14.0-alpine3.11

RUN apk update 
RUN apk upgrade

WORKDIR /app

EXPOSE 1337

COPY entrypoint.sh /usr/local/bin/

RUN chmod 755 "/usr/local/bin/entrypoint.sh"

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]



## Old Entrypoint

#!/bin/sh

# exit when any command fails
set -e

if [ -f yarn.lock ]; then

    echo "Starting existing strapi instance"

    if [ -d node_modules ]; then

        echo "Using existing dependencies"

    else 

        echo "Installing dependencies"

        yarn install --force

    fi

    yarn run strapi develop

else 

    echo "Initializing new strapi instance"

    yarn create strapi-app . --quickstart --no-run

    echo "Installing dependencies"

    yarn install --force

    echo "Initializing Open API"

    yarn run strapi install documentation

    echo "Initializing GraphQL"

    yarn run strapi install graphql

    echo "Starting strapi"

    yarn run strapi develop
fi

## Old Args Env

ARG DB_CLIENT=mongo
ARG DB_HOST=mongo
ARG DB_PORT=27017
ARG DB_NAME=strapi
ARG DB_USERNAME:strapi
ARG DB_PASSWORD:strapi

ENV DATABASE_CLIENT ${DB_CLIENT} \
    DATABASE_HOST ${DB_HOST} \
    DATABASE_PORT ${DB_PORT} \
    DATABASE_NAME ${DB_NAME} \
    DATABASE_USERNAME ${DB_USERNAME} \
    DATABASE_PASSWORD ${DB_PASSWORD}



## Intermediate Entrypoint

#!/bin/sh

# exit when any command fails
set -e

echo "Initializing strapi CLI"
yarn global add strapi

if [ -f yarn.lock ]; then

    echo "Starting existing strapi instance"

    if [ -d node_modules ]; then

        echo "Using existing dependencies"

    else 

        echo "Installing dependencies"

        yarn install --force

    fi

    echo "Bulding strapi"
    strapi build

    echo "Installing dependencies"
    yarn install --force

    echo "Starting Server"
    strapi develop

else 

    echo "Initializing new strapi instance"

    #strapi new . --dbclient mongo --dbhost mongo --dbport 27017 --dbname strapi --dbusername strapi --dbpassword strapi --dbforce --debug --no-run
    
    strapi new . --dbclient ${DATABASE_CLIENT} --dbhost ${DATABASE_HOST} --dbport ${DATABASE_PORT} --dbname $DATABASE_NAME --dbusername ${DATABASE_USERNAME} --dbpassword ${DATABASE_PASSWORD} --dbforce --debug --no-run

    echo "Installing dependencies"

    yarn install --force

    echo "Initializing Open API"

    strapi install documentation

    echo "Initializing GraphQL"

    strapi install graphql

#    echo "Starting strapi"

#    strapi develop --watch-admin

    echo "Generating API"

    strapi generate:api foo name:string description:text

    strapi generate:api bar name:string description:text

    strapi develop
#    tail -f /dev/null
fi

