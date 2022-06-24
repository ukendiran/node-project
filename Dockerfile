FROM node:alpine AS builder

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


FROM builder as dev

CMD ["npm", "run", "start:dev"]

FROM builder as prod

CMD ["npm", "run", "start"]
