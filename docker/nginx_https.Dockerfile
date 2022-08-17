FROM node:16.14.0-alpine as nodejs

ARG REACT_APP_API_URL

WORKDIR /app

COPY . .

RUN npm install && \
    npm run build

FROM staticfloat/nginx-certbot:latest

COPY --from=nodejs /app/build /app/frontend

WORKDIR /app
