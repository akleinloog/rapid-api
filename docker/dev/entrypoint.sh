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

    yarn run strapi develop --watch-admin

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

    yarn run strapi develop --watch-admin
fi