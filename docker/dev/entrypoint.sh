#!/bin/sh

# exit when any command fails
set -e

if [ -f package.json ]; then

    echo "Starting existing strapi instance"

    if [ -d node_modules ]; then

        echo "Using existing dependencies"

    else 

        echo "Installing dependencies"

        npm install

    fi

    npm run strapi develop --watch-admin

else 

    echo "Initializing new strapi instance"

    npx create-strapi-app . --quickstart --no-run

    echo "Installing dependencies"

    npm install

    echo "Initializing Open API"

    npm run strapi install documentation

    echo "Initializing GraphQL"

    npm run strapi install graphql

    echo "Starting strapi"

    npm run strapi develop --watch-admin
fi