# rapid-api

An approach for rapid API prototyping for RESTful and GraphQL based APIs.

See [this post](https://www.kleinloog.ch/post/rapid-api-prototype/) for more details.

The resulting container to get you going with rapid API prototyping is available on [docker hub](https://hub.docker.com/r/akleinloog/rapid-api) can be started as follows:

```r
docker run -p 8080:8080 akleinloog/rapid-api
```

## Run locally

Run strapi sqlite-based project:
```r
docker-compose up --build
```

Run strapi mongodb-based project:
```r
docker-compose -f docker-compose.mongo.yaml up --build
```

## Customize API

Login at http://localhost:8080/admin and create the first admin account),

After this, you can customize the API as desired.

See the strapi docs for more details.

## CLI Access

In case you want CLI access to the strapi container, you can do so using:
```r
docker exec -it api-dev /bin/sh
```

## Tagging a new version

```r
git tag -a v0.2.0 -m "Version 0.2.0"

git push origin --tags
```
