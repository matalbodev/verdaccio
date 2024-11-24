FROM node:lts-alpine as builder

USER root

ENV NODE_ENV=production

RUN npm install verdaccio-memory

FROM verdaccio/verdaccio:5

COPY ./config.yaml /verdaccio/conf

USER verdaccio

CMD node -r ./.pnp.js $VERDACCIO_APPDIR/bin/verdaccio --config /verdaccio/conf/config.yaml --listen $VERDACCIO_PROTOCOL://0.0.0.0:$VERDACCIO_PORT
