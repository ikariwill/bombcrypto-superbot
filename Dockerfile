FROM node:14-alpine

WORKDIR /home/bombcrypto-superbot
COPY . .

RUN yarn install
RUN yarn build