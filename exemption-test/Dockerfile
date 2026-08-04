FROM node:20-alpine

WORKDIR /app

COPY exemption-test/target-a/package.json exemption-test/target-a/package-lock.json ./
RUN npm ci --omit=dev

CMD ["node", "-e", "require('nock'); console.log('exemption-test artifact ready')"]
