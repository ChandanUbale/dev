# syntax=docker/dockerfile:1
# webhook test
FROM node:18-alpine

WORKDIR /app

COPY . .

# Add retry logic for yarn install
RUN npm install --network-timeout 60000 --production || \
    (echo "Retrying yarn install..." && npm install --network-timeout 60000 --production)

CMD ["node", "src/index.js"]

EXPOSE 3000
