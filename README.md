# Rapid API Prototyping

Welcome to the repository of the [Rapid API Project](https://www.kleinloog.ch/project/rapid-api/).

Rapid API provides a quick-start environment that lets you focus on your API's content and structure. More details on the implementation can be found [here](https://www.kleinloog.ch/post/rapid-api-prototyping-pt1/).

A Rapid API container is available on [docker hub](https://hub.docker.com/r/akleinloog/rapid-api), hHave a look at [this example](https://www.kleinloog.ch/post/rapid-api-prototyping-pt1/) to see how to use it.

## Run locally

Rapid API can be started as simple as follows:

```bash
docker run -p 8080:8080 akleinloog/rapid-api
```

## Run from source

To run from the local sources, simply:
```bash
docker-compose up --build
```

## Customize the API

Login at http://localhost:8080/admin and create the first admin account),

After this, you can customize the API as desired.

See the strapi docs for more details.

## CLI Access

In case you want CLI access to the strapi container, you can do so using:
```r
docker exec -it api-dev /bin/sh
```

# Mongo Db

Run the mongodb-based project:
```bash
docker-compose -f docker-compose.mongo.yaml up --build
```

## Tagging a new version

```r
git tag -a v0.2.0 -m "Version 0.2.0"

git push origin --tags
```
