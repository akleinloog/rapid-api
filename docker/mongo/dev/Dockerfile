FROM node:13.14.0-alpine3.11

RUN apk update && apk upgrade

RUN yarn global add strapi

VOLUME /app
WORKDIR /app

COPY entrypoint.sh /usr/local/bin/

RUN chmod 755 "/usr/local/bin/entrypoint.sh"

#RUN /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

#RUN strapi new --dbclient ${DB_CLIENT} --dbhost ${DB_HOST} --dbport ${DB_PORT} --dbname $DB_NAME --dbusername ${DB_USER} --dbpassword ${DB_PASSWORD} --no-run --dbforce .
#RUN strapi new --dbclient mongo --dbhost mongo --dbport 27017 --dbname strapi --dbusername strapi --dbpassword strapi --no-run --dbforce .

#EXPOSE 1337

#CMD tail -f /dev/null
