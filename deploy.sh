#!/bin/sh

set -e

IMAGE="akleinloog/rapid-api"
SEM_VER=$(git describe --abbrev=0)
CODE_VER=$(git describe --dirty="-mod")
IMG_VER="${CODE_VER:1}"
GIT_COMMIT=$(git rev-parse HEAD)

echo "Building container image"
echo "Version: " $CODE_VER
echo "Commit: " $GIT_COMMIT

docker build --force-rm --build-arg=VERSION=$CODE_VER --build-arg=VCS_REF=$GIT_COMMIT -f ./docker/sqlite/Dockerfile -t $IMAGE:$IMG_VER ./docker/sqlite

if [ $CODE_VER == $SEM_VER ]
  then
    echo "Publishing image as latest version to docker hub"
    docker tag $IMAGE:$IMG_VER $IMAGE:latest
    docker push $IMAGE:$IMG_VER
    docker push $IMAGE:latest
  else
    echo "This is not an official release, the image won't be pushed to docker hub"
fi

echo "Build completed"