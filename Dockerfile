FROM node:18-bullseye AS builder
WORKDIR /build

COPY package*.json ./
RUN npm install

COPY . .

FROM node:18-bullseye-slim
ENV NODE_ENV=development
USER node
WORKDIR /home/node/src

COPY --from=builder /build ./

EXPOSE 5000
CMD ["npm","start"]
