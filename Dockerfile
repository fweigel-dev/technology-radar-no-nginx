FROM node:18-slim

WORKDIR /src/build-your-own-radar

USER root

COPY package.json package-lock.json ./
RUN npm ci

COPY . ./

RUN npm run build:prod

EXPOSE 8080

USER 1000

CMD ["npm", "run", "serve"]
