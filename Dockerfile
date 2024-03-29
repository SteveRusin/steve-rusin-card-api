FROM node:14-alpine as build

WORKDIR app

COPY package*.json ./
RUN npm install && npm cache clean --force
COPY ./ ./
RUN npm run build

EXPOSE 4000
ENTRYPOINT ["node", "dist/main.js"]
