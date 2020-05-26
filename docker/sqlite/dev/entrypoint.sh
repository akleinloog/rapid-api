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

    echo "Starting Server"
    strapi develop

else 

    echo "Initializing new strapi instance"

    #strapi new . --dbclient mongo --dbhost mongo --dbport 27017 --dbname strapi --dbusername strapi --dbpassword strapi --dbforce --debug --no-run
    
    #strapi new . --dbclient ${DATABASE_CLIENT} --dbhost ${DATABASE_HOST} --dbport ${DATABASE_PORT} --dbname $DATABASE_NAME --dbusername ${DATABASE_USERNAME} --dbpassword ${DATABASE_PASSWORD} --dbforce --debug --no-run
    
    strapi new . --quickstart --no-run

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

    echo "Starting Server"

    strapi develop

#    tail -f /dev/null
fi