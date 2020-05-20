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

    echo "No strapi project found, something went wrong, exiting..."

fi