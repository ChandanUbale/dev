# syntax=docker/dockerfile:1
# webhook test
FROM node:18-alpine

WORKDIR /app

COPY . .

# Add retry logic for yarn install
RUN yarn install --network-timeout 60000 --production || \
    (echo "Retrying yarn install..." && yarn install --network-timeout 60000 --production)

CMD ["node", "src/index.js"]

EXPOSE 3000
