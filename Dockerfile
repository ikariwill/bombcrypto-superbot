FROM node:16-alpine

WORKDIR /home/bombcrypto-superbot
COPY . .

RUN yarn install
RUN yarn build