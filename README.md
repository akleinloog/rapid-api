# rapid-api

An approach for rapid API prototyping for RESTful and GraphQL based APIs

## Run locally

Run strapi sqlite-based project:
```
docker-compose up --build
```

Run strapi mongodb-based project:
```
docker-compose -f docker-compose.mongo.yaml up --build
```

## Customize API

Login at http://localhost:8080/admin and create the first admin account),

After this, you can customize the API as desired.

See the strapi docs for more details.

## Commit changes and publish

TODO


## Tagging a new version

```
git tag -a v0.1.0 -m "Version 0.1.0"

git push origin --tags
```
