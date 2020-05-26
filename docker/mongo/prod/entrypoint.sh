#!/bin/sh

# exit when any command fails
set -e

if [ -f yarn.lock ]; then

    echo "Starting strapi project"

    NODE_ENV=production yarn start

else 

    echo "No strapi project found, something went wrong, exiting..."

fi