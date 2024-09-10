FROM node:18

WORKDIR /usr/src/app

COPY server/package*.json ./
COPY server/.env.example ./.env
RUN npm install

COPY server/ .

COPY ./build/web /usr/src/app/web

EXPOSE 8001

CMD ["node", "server.js"]