FROM node:lts-alpine

WORKDIR /app

COPY package.json /app/
COPY package-lock.json /app/

RUN npm ci --production

COPY . /app

ENV NODE_ENV production
ENTRYPOINT ["node", "-r", "esm", "./bin/server"]
