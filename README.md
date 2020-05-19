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